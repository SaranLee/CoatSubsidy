package com.scu.coatsubsidy.service;

import com.scu.coatsubsidy.domain.WhiteList;

public interface WhiteListService {
    WhiteList login(WhiteList user);

    void insert(WhiteList user);
}
