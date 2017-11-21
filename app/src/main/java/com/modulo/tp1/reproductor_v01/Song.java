package com.modulo.tp1.reproductor_v01;

/**
 * Created by miguelyengle on 9/9/17.
 */

public class Song {

    private long id;
    private String title;
    private String artist;

    public Song(long songID, String songTitle, String songArtist){
        id = songID;
        title = songTitle;
        artist = songArtist;
    }

    public long getId() {
        return id;
    }
    public String getTitle() {
        return title;
    }
    public String getArtist() {
        return artist;
    }

    public void setId(long id) {
        this.id = id;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setArtist(String artist) {
        this.artist = artist;
    }


}
