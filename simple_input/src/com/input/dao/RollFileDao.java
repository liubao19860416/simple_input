package com.input.dao;

import java.util.List;

import com.input.pojo.RollFiles;

public interface RollFileDao {
    // 增加一条
    public void save(RollFiles rollFile);

    public List<RollFiles> find(String queryStr);

    public void update(RollFiles rollFile);

    public void delete(String id);
}
