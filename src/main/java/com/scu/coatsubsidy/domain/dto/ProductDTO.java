package com.scu.coatsubsidy.domain.dto;

import com.scu.coatsubsidy.domain.Product;

import java.util.List;

public class ProductDTO extends Product {
    private List<String> skuNames;
    private List<String> oldImgs;

    public List<String> getOldImgs() {
        return oldImgs;
    }

    public void setOldImgs(List<String> oldImgs) {
        this.oldImgs = oldImgs;
    }

    public List<String> getSkuNames() {
        return skuNames;
    }

    public void setSkuNames(List<String> skuNames) {
        this.skuNames = skuNames;
    }
}
