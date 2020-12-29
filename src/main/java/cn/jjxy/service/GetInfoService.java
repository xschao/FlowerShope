package cn.jjxy.service;

import cn.jjxy.pojo.GetInfo;
import cn.jjxy.pojo.GetInfoAdd;
import cn.jjxy.pojo.Users;

import java.util.List;

public interface GetInfoService {
    List<GetInfo> list_getInfo(Integer id);//根据用户的id来查询用户的收货地址


    //用于订单、收货人地址 的关联查询
    Users getGetInfoByOrderId(Integer id);

    Boolean addOneGetInfoData(GetInfoAdd getInfoAdd);

    /* 根据收货人id删除收货人信息*/
    Boolean delGetInfoOneData(Integer getInfoId);

    /* 修改前查询当前收货人，根据id查询 */
    GetInfo findGetInfoByGetInfoId(Integer getInfoId);

    /* 根据收货人id修改收货人信息 */
    Boolean updateGetInfoOneData(GetInfo getInfo);

}
