package cn.jjxy.service.impl;

import cn.jjxy.mapper.GetInfoMapper;
import cn.jjxy.pojo.GetInfo;
import cn.jjxy.pojo.GetInfoAdd;
import cn.jjxy.pojo.Users;
import cn.jjxy.service.GetInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class GetInfoServiceImpl implements GetInfoService {
    @Autowired
    private GetInfoMapper getInfoMapper;

    @Override
    public List<GetInfo> list_getInfo(Integer id) {
        return getInfoMapper.list_getInfo(id);
    }

    @Override
    public Users getGetInfoByOrderId(Integer id) {
        return getInfoMapper.getGetInfoByOrderId(id);
    }

    @Override
    public Boolean addOneGetInfoData(GetInfoAdd getInfoAdd) {
        return getInfoMapper.addOneGetInfoData(getInfoAdd);
    }

    @Override
    public Boolean delGetInfoOneData(Integer getInfoId) {
        return getInfoMapper.delGetInfoOneData(getInfoId);
    }

    @Override
    public GetInfo findGetInfoByGetInfoId(Integer getInfoId) {
        return getInfoMapper.findGetInfoByGetInfoId(getInfoId);
    }

    @Override
    public Boolean updateGetInfoOneData(GetInfo getInfo) {
        return getInfoMapper.updateGetInfoOneData(getInfo);
    }
}
