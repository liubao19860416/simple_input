package com.input.service;

import java.util.List;

import com.input.pojo.RollFiles;

public interface RollFileService {
    public void save(RollFiles rollFile);

    public List<RollFiles> find(String queryStr);

    public void update(RollFiles rollFile);

    public void delete(String id);

}
