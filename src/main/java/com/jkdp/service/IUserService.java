package com.jkdp.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.jkdp.dto.LoginFormDTO;
import com.jkdp.dto.Result;
import com.jkdp.entity.User;

import javax.servlet.http.HttpSession;

public interface IUserService extends IService<User> {

    Result sendCode(String phone, HttpSession session);

    Result login(LoginFormDTO loginForm, HttpSession session);
}
