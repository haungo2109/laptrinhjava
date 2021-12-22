package com.haungo.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.haungo.pojos.Auction;
import com.haungo.pojos.AuctionImage;
import com.haungo.repository.AuctionRepository;
import com.haungo.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

@Service
public class AuctionServiceImpl implements AuctionService {

    @Autowired private AuctionRepository auctionRepository;
    @Autowired private Cloudinary cloudinary;

    @Override
    public List<Auction> getAuctions(Map<String, String> params) {
        return this.auctionRepository.getAuctions(params);
    }

    @Override
    public Auction getAuctionById(Integer id) {
        return this.auctionRepository.getAuctionById(id);
    }

    @Override
    public Auction addAuction(Auction auction) {
        List<MultipartFile> files = auction.getFiles();

        if (null != files && files.size() > 0) { //Add image to auction
            Map params = ObjectUtils.asMap(
                    "folder", "assets/auction",
                    "overwrite", true,
                    "resource_type", "auto"
            );
            Set<AuctionImage> auctionImages = new HashSet<>();
            for (MultipartFile multipartFile : files) {
                try {
                    Map r = this.cloudinary.uploader().upload(multipartFile.getBytes(), params);
                    String imageUrl = (String) r.get("secure_url");
                    auctionImages.add(new AuctionImage(imageUrl));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            auction.setImages(auctionImages);
        }
        return this.auctionRepository.addAuction(auction);
    }

    @Override
    public List<Auction> getMyAuction(Integer uid) {
        return this.auctionRepository.getMyAuction(uid);
    }

    @Override
    public List<Auction> getAuctionJoin(Integer uid) {
        return null;
    }

    @Override
    public boolean setBuyler(Integer uid, Integer auctionId) {
        return this.auctionRepository.setBuyler(uid, auctionId);
    }

    @Override
    public boolean setFailer(Integer uid, Integer auctionId) {
        return this.auctionRepository.setFailer(uid, auctionId);
    }

    @Override
    public boolean cancelAuction(Integer auctionId) {
        return this.auctionRepository.cancelAuction(auctionId);
    }
}
