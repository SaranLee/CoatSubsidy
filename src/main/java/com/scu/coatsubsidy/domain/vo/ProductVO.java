package com.scu.coatsubsidy.domain.vo;

import com.scu.coatsubsidy.domain.Product;
import com.scu.coatsubsidy.domain.ProductImage;
import com.scu.coatsubsidy.domain.Sku;

import java.util.List;

public class ProductVO extends Product {
    private List<ProductImage> imgs;
    private List<Sku> skus;

    public ProductVO() {
    }

    public ProductVO(Product product){
        setId(product.getId());
        setName(product.getName());
        setProductNumber(product.getProductNumber());
        setBatchId(product.getBatchId());
        setGender(product.getGender());
        setDeleted(product.getDeleted());
        setGmtCreated(product.getGmtCreated());
        setGmtModified(product.getGmtModified());
        setDescription(product.getDescription());
    }

    public List<ProductImage> getImgs() {
        return imgs;
    }

    public void setImgs(List<ProductImage> imgs) {
        this.imgs = imgs;
    }

    public List<Sku> getSkus() {
        return skus;
    }

    public void setSkus(List<Sku> skus) {
        this.skus = skus;
    }
}
