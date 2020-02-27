var config = {

  tagline: "The Laboratory</br>Operating System",
  documentation_url: "http://localhost:4000/aquarium",
  title: "Aquarium Yeast Display",
  navigation: [

    {
      category: "Overview",
      contents: [
        { name: "Introduction", type: "local-md", path: "README.md" },
        { name: "About this Workflow", type: "local-md", path: "ABOUT.md" },
        { name: "License", type: "local-md", path: "LICENSE.md" },
        { name: "Issues", type: "external-link", path: 'https://github.com/dvnstrcklnd/aq-yeast-display/issues' }
      ]
    },

    

      {

        category: "Operation Types",

        contents: [

          
            {
              name: 'Challenge and Label',
              path: 'operation_types/Challenge_and_Label' + '.md',
              type: "local-md"
            },
          
            {
              name: 'Dilute Yeast Library',
              path: 'operation_types/Dilute_Yeast_Library' + '.md',
              type: "local-md"
            },
          
            {
              name: 'Innoculate Yeast Library',
              path: 'operation_types/Innoculate_Yeast_Library' + '.md',
              type: "local-md"
            },
          
            {
              name: 'Mass Plan Data Upload',
              path: 'operation_types/Mass_Plan_Data_Upload' + '.md',
              type: "local-md"
            },
          
            {
              name: 'Mix Cultures',
              path: 'operation_types/Mix_Cultures' + '.md',
              type: "local-md"
            },
          
            {
              name: 'Sort Yeast Display Library',
              path: 'operation_types/Sort_Yeast_Display_Library' + '.md',
              type: "local-md"
            },
          
            {
              name: 'Store Yeast Library Sample',
              path: 'operation_types/Store_Yeast_Library_Sample' + '.md',
              type: "local-md"
            },
          

        ]

      },

    

    

      {

        category: "Libraries",

        contents: [

          
            {
              name: 'ChallengeAndLabelDebug',
              path: 'libraries/ChallengeAndLabelDebug' + '.html',
              type: "local-webpage"
            },
          
            {
              name: 'ChallengeAndLabelHelper',
              path: 'libraries/ChallengeAndLabelHelper' + '.html',
              type: "local-webpage"
            },
          
            {
              name: 'FastMixAndQuench',
              path: 'libraries/FastMixAndQuench' + '.html',
              type: "local-webpage"
            },
          
            {
              name: 'LabelWithAntibody',
              path: 'libraries/LabelWithAntibody' + '.html',
              type: "local-webpage"
            },
          
            {
              name: 'NormalizeCultureDensity',
              path: 'libraries/NormalizeCultureDensity' + '.html',
              type: "local-webpage"
            },
          
            {
              name: 'PrepareTreatmentDilutions',
              path: 'libraries/PrepareTreatmentDilutions' + '.html',
              type: "local-webpage"
            },
          
            {
              name: 'WashYeast',
              path: 'libraries/WashYeast' + '.html',
              type: "local-webpage"
            },
          
            {
              name: 'YeastDisplayHelper',
              path: 'libraries/YeastDisplayHelper' + '.html',
              type: "local-webpage"
            },
          
            {
              name: 'YeastDisplayShows',
              path: 'libraries/YeastDisplayShows' + '.html',
              type: "local-webpage"
            },
          

        ]

    },

    

    
      { category: "Sample Types",
        contents: [
          
            {
              name: 'Antibody',
              path: 'sample_types/Antibody'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Assay Buffer',
              path: 'sample_types/Assay_Buffer'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Biotinylated Binding Target',
              path: 'sample_types/Biotinylated_Binding_Target'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'DNA Library',
              path: 'sample_types/DNA_Library'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'E coli strain',
              path: 'sample_types/E_coli_strain'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Fragment',
              path: 'sample_types/Fragment'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Media',
              path: 'sample_types/Media'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Oligo Pool',
              path: 'sample_types/Oligo_Pool'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Plasmid',
              path: 'sample_types/Plasmid'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Primer',
              path: 'sample_types/Primer'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Protease',
              path: 'sample_types/Protease'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Yeast Strain',
              path: 'sample_types/Yeast_Strain'  + '.md',
              type: "local-md"
            },
          
        ]
      },
      { category: "Containers",
        contents: [
          
            {
              name: '800 mL Liquid',
              path: 'object_types/800_mL_Liquid'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Antibody Stock',
              path: 'object_types/Antibody_Stock'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Biotinylated Binding Target Stock',
              path: 'object_types/Biotinylated_Binding_Target_Stock'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Divided Yeast Plate',
              path: 'object_types/Divided_Yeast_Plate'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Labeled Yeast Library Suspension',
              path: 'object_types/Labeled_Yeast_Library_Suspension'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Labeled Yeast Strain Suspension',
              path: 'object_types/Labeled_Yeast_Strain_Suspension'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Protease Stock',
              path: 'object_types/Protease_Stock'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Yeast 50ml culture',
              path: 'object_types/Yeast_50ml_culture'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Yeast 5ml culture',
              path: 'object_types/Yeast_5ml_culture'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Yeast Library Glycerol Stock',
              path: 'object_types/Yeast_Library_Glycerol_Stock'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Yeast Library Liquid Culture',
              path: 'object_types/Yeast_Library_Liquid_Culture'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Yeast Library in Soln 1',
              path: 'object_types/Yeast_Library_in_Soln_1'  + '.md',
              type: "local-md"
            },
          
            {
              name: 'Yeast Plate',
              path: 'object_types/Yeast_Plate'  + '.md',
              type: "local-md"
            },
          
        ]
      }
    

  ]

};
