package spring_Dahyang.likes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring_Dahyang.feed.model.Likes;
import spring_Dahyang.feed.repository.LikesMapper;

@Service
public class LikesService {
	
	@Autowired
    private LikesMapper likesMapper;

    @Transactional
    public boolean toggleLike(int uid, int fid, int clid) {
        Likes like = likesMapper.selectByUserAndFeed(uid, fid);
        if (like != null) {
            likesMapper.delete(like.getLid());
            return false; // 좋아요 취소
        } else {
            Likes newLike = new Likes(0, fid, clid, uid);
            likesMapper.insert(newLike);
            return true; // 좋아요 추가
        }
    }

    public boolean isLiked(int uid, int fid) {
        Likes like = likesMapper.selectByUserAndFeed(uid, fid);
        return like != null;
    }
	
}
