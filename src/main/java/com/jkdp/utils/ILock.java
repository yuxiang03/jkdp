package com.jkdp.utils;

public interface ILock {
    boolean tryLock(Long timeOutSec);
    void unLock();
}
