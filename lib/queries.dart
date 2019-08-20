// Sample Query 
const readSongName = '''
  query readSongName {
    songs{
      edges{
        node{
          title
        }
      }
    }
  }
''';

//Get All Song Title & ID (both Malayalam and English)

const getAllSongsTitle = '''
  query getAllSongsTitle {
    songs{
      edges{
        node{
          songId
          songDetails{
            nameEnglish
            nameMalayalam
          }
        }
      }
    }
  }
''';

// Get All Song Title & and Image

const getAllSongsTitleAndImage = '''
  query getAllSongsTitleAndImage {
    songs {
      edges {
        node {
          songId
          songDetails {
            nameEnglish
            nameMalayalam
            movie {
              ... on Movie {
                id
                movieDetails {
                  images {
                    link
                  }
                }
              }
            }
          }
        }
      }
    }
  }
''';

// Get complete Song details

const getCompleteSongDetails = '''
''';