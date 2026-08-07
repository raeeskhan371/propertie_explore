import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/helper/cloudnary_helper_fucntions.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:propertie_explore/feature/properties/Owner/screens/property_detail_screen.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/explore_property_screen_widgets/search_bar.dart';
import 'package:propertie_explore/feature/properties/customer/services/services.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:provider/provider.dart';

class ExplorePropertiesScreen extends StatefulWidget {
  const ExplorePropertiesScreen({super.key});

  @override
  State<ExplorePropertiesScreen> createState() =>
      _ExplorePropertiesScreenState();
}

class _ExplorePropertiesScreenState extends State<ExplorePropertiesScreen> {
  CustomerServices property = CustomerServices();

  final ScrollController _scrollController = ScrollController();

  late OwnerPropertyProvider _provider;

  @override
  void initState() {
    _provider = context.read<OwnerPropertyProvider>();
    _provider.fetchinProperties();
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _provider.fetchinProperties();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Property Explore",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
          ),
        ),
        child: Column(
          children: [
            PropertySearchBar(),
            Expanded(
              child: Consumer<OwnerPropertyProvider>(
                builder: (context, provider, child) {
                  final data = provider.searchQuery.isEmpty
                      ? provider.properties
                      : provider.searchResults;

                  if (provider.isLoading && data.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (data.isEmpty) {
                    return const Center(child: Text("No Properties Found"));
                  }
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final propertyItem = data[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PropertyDetailsScreen(
                                propertyData: propertyItem,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Property Image
                              Container(
                                height: 180,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: CloudnaryHelper.optimizeImage(
                                    imageUrl:
                                        propertyItem.propertyImageUrls.first,
                                    width: 600,
                                    height: 400,
                                  ),
                                  fit: BoxFit.cover,

                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16),
                                        ),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                  placeholder: (context, url) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },

                                  errorWidget: (context, url, error) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16),
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          size: 40,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title & Purpose
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${propertyItem.title}",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            "For Sale",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(
                                            "${propertyItem.profileImageUrl}",
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          "Published by: ${propertyItem.ownerName}",
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),

                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.red,
                                          size: 18,
                                        ),
                                        SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            propertyItem.location,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 12),

                                    Row(
                                      children: [
                                        Text(
                                          "Rs ${context.read<OwnerPropertyProvider>().priceFormeter(propertyItem.price)}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "Contact:${propertyItem.contact ?? "no Contact yet"}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 12),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.bed_outlined, size: 18),
                                            SizedBox(width: 4),
                                            Text(
                                              "${propertyItem.bed.toString()} Beds",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.bathtub_outlined,
                                              size: 18,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "${propertyItem.bath.toString()} Baths",
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.square_foot_outlined,
                                              size: 18,
                                            ),
                                            SizedBox(width: 4),
                                            Text("${propertyItem.area} Marla"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
