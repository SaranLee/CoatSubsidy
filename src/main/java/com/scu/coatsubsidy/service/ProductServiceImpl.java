package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.Product;
import com.scu.coatsubsidy.domain.ProductExample;
import com.scu.coatsubsidy.domain.ProductImage;
import com.scu.coatsubsidy.domain.Sku;
import com.scu.coatsubsidy.domain.dto.ProductDTO;
import com.scu.coatsubsidy.domain.vo.ProductVO;
import com.scu.coatsubsidy.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import static com.scu.coatsubsidy.common.Constant.NOT_DELETED;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper mapper;

    @Autowired
    private ProductImageService productImageService;

    @Autowired
    private SkuService skuService;

    @Override
    public boolean add(Product product, MultipartFile[] files, String imgPathPrefix) {
        mapper.insertSelective(product);
        List<String> skuNames = ((ProductDTO) product).getSkuNames();
        File dir = new File(imgPathPrefix);
        if(!dir.exists())
            dir.mkdirs();

        List<ProductImage> imgs = Arrays.stream(files).filter(file -> file.getSize() > 0).map(file -> {
            String imgName = file.getOriginalFilename();
            String uuid = UUID.randomUUID().toString().substring(16).replaceAll("-", "").toUpperCase();
            String filename = uuid + "_" + imgName;
            ProductImage img = new ProductImage();
            img.setProductId(product.getId());
            img.setName(imgName);
            img.setPath("/static/img/" + filename);
            try {
                file.transferTo(new File(dir, filename));
            } catch (IOException e) {
                e.printStackTrace();
            }
            return img;
        }).collect(Collectors.toList());

        List<Sku> skus = skuNames.stream().map(skuName -> {
            Sku sku = new Sku();
            sku.setProductId(product.getId());
            sku.setName(skuName);
            return sku;
        }).collect(Collectors.toList());

        return productImageService.insertBatch(imgs) && skuService.insertBatch(skus);
    }

    @Override
    public List<ProductVO> getAll() {
        ProductExample example = new ProductExample();
        example.createCriteria().andDeletedEqualTo(NOT_DELETED);
        List<Product> products = mapper.selectByExampleWithBLOBs(example);
        return products.stream().map(this::getProductVO).collect(Collectors.toList());
    }

    @Override
    public ProductVO getById(Integer id) {
        ProductExample example = new ProductExample();
        example.createCriteria().andIdEqualTo(id.longValue()).andDeletedEqualTo(NOT_DELETED);
        List<Product> list = mapper.selectByExampleWithBLOBs(example);
        if(list.size() <= 0)
            return null;
        else{
            System.err.println("description: " + list.get(0).getDescription());
            return getProductVO(list.get(0));
        }
    }

    @Override
    public boolean updateById(ProductDTO product, MultipartFile[] files, String imgPathPrefix) {
        mapper.updateByPrimaryKeySelective(product);
        skuService.deleteById(product.getId());
        List<Sku> skus = product.getSkuNames().stream().map(skuName -> {
            Sku sku = new Sku();
            sku.setProductId(product.getId());
            sku.setName(skuName);
            return sku;
        }).collect(Collectors.toList());

        productImageService.delete(product.getId(), product.getOldImgs());
        File dir = new File(imgPathPrefix);
        if(!dir.exists())
            dir.mkdirs();
        List<ProductImage> imgs = Arrays.stream(files).filter(file -> file.getSize() > 0).map(file -> {
            String imgName = file.getOriginalFilename();
            String uuid = UUID.randomUUID().toString().substring(16).replaceAll("-", "").toUpperCase();
            String filename = uuid + "_" + imgName;
            ProductImage img = new ProductImage();
            img.setProductId(product.getId());
            img.setName(imgName);
            img.setPath("/static/img/" + filename);
            try {
                file.transferTo(new File(dir, filename));
            } catch (IOException e) {
                e.printStackTrace();
            }
            return img;
        }).collect(Collectors.toList());

        return productImageService.insertBatch(imgs) && skuService.insertBatch(skus);
    }


    private ProductVO getProductVO(Product product){
        ProductVO productVO = new ProductVO(product);
        productVO.setImgs(productImageService.getImgsByProductId(product.getId()));
        productVO.setSkus(skuService.getSkusByProductId(product.getId()));
        return productVO;
    }
}
