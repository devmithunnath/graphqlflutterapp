//Get All Song Title & ID and Images in Malayalam and English

const getAllSongsMA = '''
  query getAllSongsTitle {
    songs {
      edges {
        node {
          id
          songDetails {
            nameMalayalam
            coverImageMobile {
              sourceUrl(size: THUMBNAIL)
            }
          }
        }
      }
    }
  }
''';

// English version query

const getAllSongsEN = '''
  query getAllSongsTitle {
    songs {
      edges {
        node {
          id
          songDetails {
            nameEnglish
            coverImageMobile {
              sourceUrl(size: THUMBNAIL)
            }
          }
        }
      }
    }
  }
''';

// Get Song Details in Malayalam

const getSongDetailsMA = '''
  query getSongDetailsMA {
    song(id: "153") {
      songDetails {
        coverImageMobile {
          sourceUrl
        }
        nameEnglish
        nameMalayalam
        songEnglish
        songMalayalam
      }
    }
  }
''';

// Get all years 

const getAllYears = '''
  query getAllYears {
    years(where: {orderby: {field: DATE, order: ASC}}) {
      edges {
        node {
          title
          id
        }
      }
    }
  }
''';