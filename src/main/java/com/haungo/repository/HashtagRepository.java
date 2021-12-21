package com.haungo.repository;

import com.haungo.pojos.Hashtag;

import java.util.List;

public interface HashtagRepository {
    Hashtag getHashtagById(Integer id);
    List<Hashtag> getHashtags();
    Hashtag addHashtag(Hashtag hashtag);
    Hashtag getHashtagByName(String name);
}
