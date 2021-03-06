/*
 * PolyLoader.hpp
 *
 *  Created on: 9 Apr 2021
 *      Author: mathieu
 */

#ifndef POLYLOADER_HPP_
#define POLYLOADER_HPP_

#include <cstdio>
#include <cstdlib>
#include <cstdint>
#include <cstring>
#include <fstream>
#include <algorithm>
#include <math.h>

#include "stb_image/stb_image.h"
#include "stb_image/stb_image_write.h"

#include "../../muonium-engine/src/ue_engine.hpp"

class PolyLoader
{
public:
  ue::Poly loadFromObj(
      const char* objectPath,
      const char* texturePath,
      ue::Vector3 size
  );
  ue::Texture loadTexture(const char* path);
  void printObject(ue::Poly);

  ue::CubeMap loadCubeMap(const char* path);

};

#endif /* POLYLOADER_HPP_ */
