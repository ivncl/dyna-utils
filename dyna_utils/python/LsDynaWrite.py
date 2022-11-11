#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Dec 21 11:40:32 2021

@author: ivan

Module collecting a few LS-DYNA pre-processing functions able to write data to 
file in .k format.

"""

def WriteNodes(NIds,NodalCoords,Filename,Permission):
    """
    Write nodes (*NODE keyword) to file in LS-DYNA .k format
    INPUTS: 
        - NIds: Nx1 array of nodal ids
        - NodalCoords: Nx3 array of nodal coordinates
        - Filename: string containing the filename (without extension)
        - Permission: write/append ('w'/'a')
    OUTPUTS:
        none
    --------------------------------------------------------------------------    
    *NODE
    $#   nid               x               y               z      tc      rc  
           1        6645.999        2.628905        4940.287       0       0
           2        6468.327        1.105805        4697.612       0       0
    --------------------------------------------------------------------------
    """
    
    f = open(Filename + '.k', Permission)
    
    N=len(NIds)
    
    NN = list(range(0, N))
    
    f.write('*NODE\n')
    f.write('$#   nid               x               y               z      tc      rc\n');
    for i in NN:
        f.write(str("{:8d}".format(NIds[i])) + \
                str("{:+.13e}".format(NodalCoords[i][0])) + \
                str("{:+.13e}".format(NodalCoords[i][1])) + \
                str("{:+.13e}".format(NodalCoords[i][2])) + \
                str("{:8d}".format(0)) + \
                str("{:8d}".format(0)) + \
                '\n'  ) 
    
    f.close()

def WriteNodes_csv(NIds,NodalCoords,Filename,Permission):
    """
    Write nodes (*NODE keyword) to file in LS-DYNA .k format
    INPUTS: 
        - NIds: Nx1 array of nodal ids
        - NodalCoords: Nx3 array of nodal coordinates
        - Filename: string containing the filename (without extension)
        - Permission: write/append ('w'/'a')
    OUTPUTS:
        none
    --------------------------------------------------------------------------    
    *NODE
    $#   nid               x               y               z      tc      rc  
           1        6645.999        2.628905        4940.287       0       0
           2        6468.327        1.105805        4697.612       0       0
    --------------------------------------------------------------------------
    """
    
    f = open(Filename + '.k', Permission)
    
    N=len(NIds)
    
    NN = list(range(0, N))
    
    f.write('*NODE\n')
    f.write('$#   nid               x               y               z      tc      rc\n');
    for i in NN:
        f.write(str("{:d},".format(NIds[i])) + \
                str("{:+.9e},".format(NodalCoords[i][0])) + \
                str("{:+.9e},".format(NodalCoords[i][1])) + \
                str("{:+.9e},".format(NodalCoords[i][2])) + \
                str("{:d},".format(0)) + \
                str("{:d}".format(0)) + \
                '\n'  ) 
    
    f.close()
    
def WriteElemSolids(EIds,PIds,ElemConnectivity,Filename,Permission):
    """
    Write solid elements (*ELEMENT_SOLID keyword) to file in LS-DYNA .k format
    INPUTS: 
        - EIds: Nx1 array of elem ids
        - PIds: Nx1 array of elem part ids
        - ElemConnectivity: Nx8 (or Nx4) array of elem connectivity
        - Filename: string containing the filename (without extension)
        - Permission: write/append ('w'/'a')
    OUTPUTS:
        none
    --------------------------------------------------------------------------    
    *ELEMENT_SOLID
    $#   eid     pid      n1      n2      n3      n4      n5      n6      n7      n8
           1       1       1       2      13      12     122     123     134     133
    --------------------------------------------------------------------------
    """
    
    f = open(Filename + '.k', Permission)
    
    N=len(EIds)
    
    NN = list(range(0, N))
    
    f.write('*ELEMENT_SOLID\n')
    f.write('$#   eid     pid      n1      n2      n3      n4      n5      n6      n7      n8\n');
    if len(ElemConnectivity[0])==8:
        for i in NN:
            f.write(str("{:8d}".format(EIds[i])) + \
                    str("{:8d}".format(PIds[i])) + \
                    str("{:8d}".format(ElemConnectivity[i][0])) + \
                    str("{:8d}".format(ElemConnectivity[i][1])) + \
                    str("{:8d}".format(ElemConnectivity[i][2])) + \
                    str("{:8d}".format(ElemConnectivity[i][3])) + \
                    str("{:8d}".format(ElemConnectivity[i][4])) + \
                    str("{:8d}".format(ElemConnectivity[i][5])) + \
                    str("{:8d}".format(ElemConnectivity[i][6])) + \
                    str("{:8d}".format(ElemConnectivity[i][7])) + \
                    '\n'  )
    else:
        if len(ElemConnectivity[0])==4:
            for i in NN:
                f.write(str("{:8d}".format(EIds[i])) + \
                        str("{:8d}".format(PIds[i])) + \
                        str("{:8d}".format(ElemConnectivity[i][0])) + \
                        str("{:8d}".format(ElemConnectivity[i][1])) + \
                        str("{:8d}".format(ElemConnectivity[i][2])) + \
                        str("{:8d}".format(ElemConnectivity[i][3])) + \
                        str("{:8d}".format(0)) + \
                        str("{:8d}".format(0)) + \
                        str("{:8d}".format(0)) + \
                        str("{:8d}".format(0)) + \
                        '\n'  ) 
            
    f.close()

    
def WriteElemSolids_csv(EIds,PIds,ElemConnectivity,Filename,Permission):
    """
    Write solid elements (*ELEMENT_SOLID keyword) to file in LS-DYNA .k format
    INPUTS: 
        - EIds: Nx1 array of elem ids
        - PIds: Nx1 array of elem part ids
        - ElemConnectivity: Nx8 array of elem connectivity
        - Filename: string containing the filename (without extension)
        - Permission: write/append ('w'/'a')
    OUTPUTS:
        none
    --------------------------------------------------------------------------    
    *ELEMENT_SOLID
    $#   eid     pid      n1      n2      n3      n4      n5      n6      n7      n8
           1       1       1       2      13      12     122     123     134     133
    --------------------------------------------------------------------------
    """
    
    f = open(Filename + '.k', Permission)
    
    N=len(EIds)
    
    NN = list(range(0, N))
    
    f.write('*ELEMENT_SOLID\n')
    f.write('$#   eid     pid      n1      n2      n3      n4      n5      n6      n7      n8\n');
    if len(ElemConnectivity[0])==8:
        for i in NN:
            f.write(str("{:d},".format(EIds[i])) + \
                    str("{:d},".format(PIds[i])) + \
                    str("{:d},".format(ElemConnectivity[i][0])) + \
                    str("{:d},".format(ElemConnectivity[i][1])) + \
                    str("{:d},".format(ElemConnectivity[i][2])) + \
                    str("{:d},".format(ElemConnectivity[i][3])) + \
                    str("{:d},".format(ElemConnectivity[i][4])) + \
                    str("{:d},".format(ElemConnectivity[i][5])) + \
                    str("{:d},".format(ElemConnectivity[i][6])) + \
                    str("{:d}".format(ElemConnectivity[i][7])) + \
                    '\n'  ) 
    else:
        if len(ElemConnectivity[0])==4:
            for i in NN:
                f.write(str("{:d},".format(EIds[i])) + \
                        str("{:d},".format(PIds[i])) + \
                        str("{:d},".format(ElemConnectivity[i][0])) + \
                        str("{:d},".format(ElemConnectivity[i][1])) + \
                        str("{:d},".format(ElemConnectivity[i][2])) + \
                        str("{:d}".format(ElemConnectivity[i][3])) + \
                        '\n'  ) 
            
    f.close()        
    
def WriteElemBeams(EIds,PIds,ElemConnectivity,Filename,Permission):
    """
    Write solid elements (*ELEMENT_SOLID keyword) to file in LS-DYNA .k format
    INPUTS: 
        - EIds: Nx1 array of elem ids
        - PIds: Nx1 array of elem part ids
        - ElemConnectivity: Nx3 array of elem connectivity, third node may be 0
        - Filename: string containing the filename (without extension)
        - Permission: write/append ('w'/'a')
    OUTPUTS:
        none
    --------------------------------------------------------------------------    
    *ELEMENT_BEAM
    $#   eid     pid      n1      n2      n3     rt1     rr1     rt2     rr2   local
    39751000 6071519  397510  329469       0       0       0       0       0       2
    40068400 6071519  400684  329468       0       0       0       0       0       2
    --------------------------------------------------------------------------
    """
    
    f = open(Filename + '.k', Permission)
    
    N=len(EIds)
    
    NN = list(range(0, N))
    
    f.write('*ELEMENT_BEAM\n')
    f.write('$#   eid     pid      n1      n2      n3     rt1     rr1     rt2     rr2   local\n')
    for i in NN:
        f.write(str("{:8d}".format(EIds[i])) + \
                str("{:8d}".format(PIds[i])) + \
                str("{:8d}".format(ElemConnectivity[i][0])) + \
                str("{:8d}".format(ElemConnectivity[i][1])) + \
                str("{:8d}".format(ElemConnectivity[i][2])) + \
                '       0       0       0       0       2\n'  ) 
    
    f.close()
    
def WriteSectionBeam(row1,row2,Filename,Permission):
    """
    Write section beam (*SECTION_BEAM keyword) to file in LS-DYNA .k format
    INPUTS: 
        - row1: array of valuess in row1
        - row2: array of valuess in row1
        - Filename: string containing the filename (without extension)
        - Permission: write/append ('w'/'a')
    OUTPUTS:
        none
    --------------------------------------------------------------------------    
    *SECTION_BEAM
    $#   secid    elform      shrf   qr/irid       cst     scoor       nsm     naupd
           311         1       1.0         2         1       0.0       0.0         0
    $#     ts1       ts2       tt1       tt2     nsloc     ntloc     
           4.0       4.0       0.0       0.0       0.0       0.0
    --------------------------------------------------------------------------
    """
    
    f = open(Filename + '.k', Permission)
    
    f.write('*SECTION_BEAM\n')
    f.write('$#   secid    elform      shrf   qr/irid       cst     scoor       nsm     naupd\n')
    f.write(str("{:10d}".format(row1[0])) + \
            str("{:10d}".format(row1[1])) + \
            str("{:+.3e}".format(row1[2])) + \
            str("{:10d}".format(row1[3])) + \
            str("{:10d}".format(row1[4])) + \
            str("{:+.3e}".format(row1[5])) + \
            str("{:+.3e}".format(row1[6])) + \
            str("{:10d}".format(row1[7])) + \
            '\n'  ) 
    f.write('$#     ts1       ts2       tt1       tt2     nsloc     ntloc\n')
    f.write(str("{:+.3e}".format(row2[0])) + \
            str("{:+.3e}".format(row2[1])) + \
            str("{:+.3e}".format(row2[2])) + \
            str("{:+.3e}".format(row2[3])) + \
            str("{:+.3e}".format(row2[4])) + \
            str("{:+.3e}".format(row2[5])) + \
            '\n'  ) 
    
    
    f.close()
    
    

def WritePart(row1,title,Filename,Permission):
    """
    Write part (*PART keyword) to file in LS-DYNA .k format
    INPUTS: 
        - row1: array of valuess in row1
        - Filename: string containing the filename (without extension)
        - Permission: write/append ('w'/'a')
    OUTPUTS:
        none
    --------------------------------------------------------------------------    
    *PART
    $#                                                                         title
    roofbeams_rebars_up
    $#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
           313       311         6         0         0         0         0         0
    --------------------------------------------------------------------------
    """
    
    f = open(Filename + '.k', Permission)
    
    f.write('*PART\n')
    f.write('$#\n')
    f.write('%s\n' % title)
    f.write('$#   secid    elform      shrf   qr/irid       cst     scoor       nsm     naupd\n')
    f.write(str("{:10d}".format(row1[0])) + \
            str("{:10d}".format(row1[1])) + \
            str("{:10d}".format(row1[2])) + \
            str("{:10d}".format(row1[3])) + \
            str("{:10d}".format(row1[4])) + \
            str("{:10d}".format(row1[5])) + \
            str("{:10d}".format(row1[6])) + \
            str("{:10d}".format(row1[7])) + \
            '\n'  )
    
    f.close()
    
    
def WriteDefTrasf(tranid,transf,row,title,Filename,Permission):
    """
    Write part (*DEFINE_TRANSFORMATION keyword) to file in LS-DYNA .k format
    INPUTS: 
        - tranid: transf id
        - transf: transf code
        - row: array of valuess in row
        - Filename: string containing the filename (without extension)
        - Permission: write/append ('w'/'a')
    OUTPUTS:
        none
    --------------------------------------------------------------------------    
    *DEFINE_TRANSFORMATION
    $#  tranid      
             1
    $#  option        a1        a2        a3        a4        a5        a6        a7
    TRANSL         -10.0     -10.0       0.0       0.0       0.0       0.0       0.0
    --------------------------------------------------------------------------
    """
    
    f = open(Filename + '.k', Permission)
    
    f.write('*DEFINE_TRANSFORMATION\n')
    f.write('$#  tranid\n')
    f.write(str("{:10d}\n".format(tranid)))
    f.write('$#  option        a1        a2        a3        a4        a5        a6        a7\n')
    f.write(str("{:10}".format(transf)) + \
            str("{:+.3e}".format(row[0])) + \
            str("{:+.3e}".format(row[1])) + \
            str("{:+.3e}".format(row[2])) + \
            str("{:+.3e}".format(row[3])) + \
            str("{:+.3e}".format(row[4])) + \
            str("{:+.3e}".format(row[5])) + \
            str("{:+.3e}".format(row[6])) + \
            '\n'  )
    
    f.close()  
    
def WriteDefCurve(row,data,title,Filename,Permission):
    """
    Write part (*DEFINE_CURVE_TITLE keyword) to file in LS-DYNA .k format
    INPUTS: 
        - row: array of values in card1
        - data: nx2 numpy array
        - Filename: string containing the filename (without extension)
        - Permission: write/append ('w'/'a')
    OUTPUTS:
        none
    --------------------------------------------------------------------------    
    *DEFINE_CURVE_TITLE
    motion
    $#    lcid      sidr       sfa       sfo      offa      offo    dattyp     lcint
             1         0       1.0       1.0       0.0       0.0         0         0
    $#                a1                  o1  
                     0.0                 0.0
                     0.5                10.0
    --------------------------------------------------------------------------
    """
    
    f = open(Filename + '.k', Permission)
    
    f.write('*DEFINE_CURVE_TITLE\n')
    f.write(str("{:10}\n".format(title)))
    f.write('$#    lcid      sidr       sfa       sfo      offa      offo    dattyp     lcint\n')
    f.write(str("{:10d}".format(int(row[0]))) + \
            str("{:10d}".format(int(row[1]))) + \
            str("{:+.3e}".format(row[2])) + \
            str("{:+.3e}".format(row[3])) + \
            str("{:+.3e}".format(row[4])) + \
            str("{:+.3e}".format(row[5])) + \
            str("{:10d}".format(int(row[6]))) + \
            str("{:10d}".format(int(row[7]))) + \
            '\n'  )
    f.write('$#                a1                  o1\n')
    for i in range(0,2):
        f.write(str("{:+.13e}".format(data[i][0])) + \
                str("{:+.13e}".format(data[i][1])) + \
                '\n'  )
    
    f.close()  
    
def WriteSPH(NIds,PIds,masses,Filename,Permission):
    """
    Write SPH (*ELEMENT_SPH keyword) to file in LS-DYNA .k format
    INPUTS: 
        - NIds: Nx1 array of nodal ids
        - PIds: Nx1 array of elem part ids
        - masess: Nx1 array of nodal masses
        - Filename: string containing the filename (without extension)
        - Permission: write/append ('w'/'a')
    OUTPUTS:
        none
    --------------------------------------------------------------------------    
    *ELEMENT_SPH
    $#   nid     pid            mass    
     1000001     101    2.264088e-04
     1000002     101    2.264088e-04
    --------------------------------------------------------------------------
    """
    
    f = open(Filename + '.k', Permission)
    
    N=len(NIds)
    
    NN = list(range(0, N))
    
    f.write('*ELEMENT_SPH\n')
    f.write('$#   nid     pid            mass\n');
    for i in NN:
        f.write(str("{:8d}".format(NIds[i])) + \
                str("{:8d}".format(PIds[i])) + \
                str("{:+.13e}".format(masses[i])) + \
                '\n'  ) 
    
    f.close()
