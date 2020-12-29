package cn.jjxy.mapper;

import cn.jjxy.pojo.GetInfo;
import cn.jjxy.pojo.GetInfoAdd;
import cn.jjxy.pojo.Users;

import java.util.List;

public interface GetInfoMapper {
     /*相对与下面为什么要设置这个方法，因为我们要根据收货人细明，查询用户操作，我们设置是一对多的双向关系查询，而一对一我们
     * 只设置了单向查询关联*/
     List<GetInfo> list_getInfo(Integer id);

    /* 用于订单、收货人地址 的关联查询。但是我们不调用这个方法，我们不用根据收货地址查询订单，
    * 但getGetInfoByOrderId这个方法我们定义了操作，因为我们要根据订单查询收货人地址，设置了关联 * */
     Users getGetInfoByOrderId(Integer id);

     /* 添加收货人信息 */
     Boolean addOneGetInfoData(GetInfoAdd getInfoAdd);

     /* 根据收货人id删除收货人信息*/
     Boolean delGetInfoOneData(Integer getInfoId);

     /* 修改前查询当前收货人，根据id查询 */
     GetInfo findGetInfoByGetInfoId(Integer getInfoId);

     /* 根据收货人id修改收货人信息 */
     Boolean updateGetInfoOneData(GetInfo getInfo);
}
