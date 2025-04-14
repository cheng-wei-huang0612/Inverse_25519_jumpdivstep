In the following speed table, smaller numbers are better.
The numbers are median single-core cycle counts on various microarchitectures.
Overclocking is disabled.

The table reports cycle counts from lib25519 and, for comparison,
OpenSSL and s2n-bignum.
For comparability to OpenSSL's speed-testing utility,
the OpenSSL cycle counts omit various OpenSSL overheads; see below for details.
The s2n-bignum and lib25519 cycle counts include all overheads.
There is also a lib25519+s2n line showing separate measurements of lib25519
after an optional pre-configuration `./use-s2n-bignum` step
(which is a supported option for lib25519);
a lib25519+exp line showing separate measurements of lib25519
after an experimental pre-configuration `mv skipcompilers/* compilers` step
(which is unsupported: it uses instructions not supported by `valgrind`);
and a lib25519+s2n+exp line.


| μarch | software | X key | X dh | X batch | Ed key | Ed sign | Ed verif | Ed MSM |
| :---- | :------- | ----: | ---: | ------: | -----: | ------: | -------: | -----: |
| Golden Cove (2021) | <span class=openssl>OpenSSL</span> | <span class=openssl>99570</span> | <span class=openssl>103325</span> | | <span class=openssl>101362</span> | <span class=openssl>96222</span> | <span class=openssl>320673</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>23914</span> | <span class=lib25519>68409</span> | <span class=lib25519>51758</span> | <span class=lib25519>24748</span> | <span class=lib25519>28210</span> | <span class=lib25519>95452</span> | <span class=lib25519>30420
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>23917</span> | <span class=lib25519>67931</span> | <span class=lib25519>49930</span> | <span class=lib25519>24320</span> | <span class=lib25519>27837</span> | <span class=lib25519>95627</span> | <span class=lib25519>30638
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>23565</span> | <span class=lib25519>68471</span> | <span class=lib25519>49924</span> | <span class=lib25519>24449</span> | <span class=lib25519>27792</span> | <span class=lib25519>94975</span> | <span class=lib25519>30663
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>24298</span> | <span class=lib25519>68204</span> | <span class=lib25519>51738</span> | <span class=lib25519>24538</span> | <span class=lib25519>27915</span> | <span class=lib25519>96525</span> | <span class=lib25519>30390
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>24257</span> | <span class=s2n>75395</span> | | | | | |
| Zen 3 (2020) | <span class=openssl>OpenSSL</span> | <span class=openssl>116119</span> | <span class=openssl>112550</span> | | <span class=openssl>118697</span> | <span class=openssl>111383</span> | <span class=openssl>371930</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>28685</span> | <span class=lib25519>96311</span> | <span class=lib25519>50504</span> | <span class=lib25519>28851</span> | <span class=lib25519>32440</span> | <span class=lib25519>127382</span> | <span class=lib25519>40617
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>25741</span> | <span class=lib25519>72993</span> | <span class=lib25519>47762</span> | <span class=lib25519>26555</span> | <span class=lib25519>29973</span> | <span class=lib25519>113644</span> | <span class=lib25519>35889
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>25615</span> | <span class=lib25519>73012</span> | <span class=lib25519>47731</span> | <span class=lib25519>26412</span> | <span class=lib25519>29922</span> | <span class=lib25519>114244</span> | <span class=lib25519>36038
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>28079</span> | <span class=lib25519>96085</span> | <span class=lib25519>71267</span> | <span class=lib25519>28913</span> | <span class=lib25519>32276</span> | <span class=lib25519>126871</span> | <span class=lib25519>40647
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>26238</span> | <span class=s2n>89699</span> | | | | | |
| Tiger Lake (2020) | <span class=openssl>OpenSSL</span> | <span class=openssl>113314</span> | <span class=openssl>119132</span> | | <span class=openssl>116048</span> | <span class=openssl>111383</span> | <span class=openssl>369181</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>28401</span> | <span class=lib25519>85953</span> | <span class=lib25519>62349</span> | <span class=lib25519>29251</span> | <span class=lib25519>32894</span> | <span class=lib25519>112179</span> | <span class=lib25519>35878
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>26468</span> | <span class=lib25519>64705</span> | <span class=lib25519>21672</span> | <span class=lib25519>27395</span> | <span class=lib25519>31589</span> | <span class=lib25519>109090</span> | <span class=lib25519>32759
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>26555</span> | <span class=lib25519>64620</span> | <span class=lib25519>21658</span> | <span class=lib25519>27424</span> | <span class=lib25519>31478</span> | <span class=lib25519>108282</span> | <span class=lib25519>33056
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>28186</span> | <span class=lib25519>85883</span> | <span class=lib25519>60803</span> | <span class=lib25519>28983</span> | <span class=lib25519>32853</span> | <span class=lib25519>114156</span> | <span class=lib25519>35329
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>26474</span> | <span class=s2n>83168</span> | | | | | |
| Zen 2 (2019) | <span class=openssl>OpenSSL</span> | <span class=openssl>127047</span> | <span class=openssl>118791</span> | | <span class=openssl>129676</span> | <span class=openssl>121302</span> | <span class=openssl>395245</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>27665</span> | <span class=lib25519>107760</span> | <span class=lib25519>74220</span> | <span class=lib25519>28473</span> | <span class=lib25519>31733</span> | <span class=lib25519>127604</span> | <span class=lib25519>37991
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>27718</span> | <span class=lib25519>101005</span> | <span class=lib25519>73841</span> | <span class=lib25519>28568</span> | <span class=lib25519>31949</span> | <span class=lib25519>127591</span> | <span class=lib25519>38142
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>26449</span> | <span class=lib25519>92446</span> | <span class=lib25519>74184</span> | <span class=lib25519>28539</span> | <span class=lib25519>32042</span> | <span class=lib25519>127768</span> | <span class=lib25519>38007
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>27647</span> | <span class=lib25519>108855</span> | <span class=lib25519>74127</span> | <span class=lib25519>28455</span> | <span class=lib25519>31751</span> | <span class=lib25519>127741</span> | <span class=lib25519>38208
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>27058</span> | <span class=s2n>92075</span> | | | | | |
| Ares (2019) | <span class=openssl>OpenSSL</span> | <span class=openssl>124704</span> | <span class=openssl>469056</span> | | <span class=openssl>210912</span> | <span class=openssl>181248</span> | <span class=openssl>630432</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>80796</span> | <span class=lib25519>246594</span> | <span class=lib25519>246302</span> | <span class=lib25519>81672</span> | <span class=lib25519>85248</span> | <span class=lib25519>286386</span> | <span class=lib25519>82363
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>80640</span> | <span class=lib25519>246024</span> | <span class=lib25519>246783</span> | <span class=lib25519>81534</span> | <span class=lib25519>85158</span> | <span class=lib25519>284712</span> | <span class=lib25519>82282
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>43410</span> | <span class=lib25519>95616</span> | <span class=lib25519>96381</span> | <span class=lib25519>81408</span> | <span class=lib25519>85620</span> | <span class=lib25519>283638</span> | <span class=lib25519>82711
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>43386</span> | <span class=lib25519>95616</span> | <span class=lib25519>95594</span> | <span class=lib25519>81450</span> | <span class=lib25519>85596</span> | <span class=lib25519>283896</span> | <span class=lib25519>82608
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>115392</span> | <span class=s2n>254976</span> | | | | | |
| Goldmont (2016) | <span class=openssl>OpenSSL</span> | <span class=openssl>247078</span> | <span class=openssl>273628</span> | | <span class=openssl>258924</span> | <span class=openssl>228182</span> | <span class=openssl>753852</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>93798</span> | <span class=lib25519>281771</span> | <span class=lib25519>284141</span> | <span class=lib25519>96345</span> | <span class=lib25519>106290</span> | <span class=lib25519>340904</span> | <span class=lib25519>96753
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>93581</span> | <span class=lib25519>281769</span> | <span class=lib25519>285958</span> | <span class=lib25519>96064</span> | <span class=lib25519>106090</span> | <span class=lib25519>335658</span> | <span class=lib25519>95987
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>76428</span> | <span class=lib25519>255309</span> | <span class=lib25519>262507</span> | <span class=lib25519>95938</span> | <span class=lib25519>106071</span> | <span class=lib25519>340408</span> | <span class=lib25519>96728
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>76448</span> | <span class=lib25519>255298</span> | <span class=lib25519>256944</span> | <span class=lib25519>96410</span> | <span class=lib25519>105941</span> | <span class=lib25519>342036</span> | <span class=lib25519>97016
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>77436</span> | <span class=s2n>255312</span> | | | | | |
| Cortex-A72 (2016) | <span class=openssl>OpenSSL</span> | <span class=openssl>156925</span> | <span class=openssl>424557</span> | | <span class=openssl>163459</span> | <span class=openssl>134998</span> | <span class=openssl>425152</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>106181</span> | <span class=lib25519>329823</span> | <span class=lib25519>331034</span> | <span class=lib25519>108075</span> | <span class=lib25519>115362</span> | <span class=lib25519>391903</span> | <span class=lib25519>116174
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>106339</span> | <span class=lib25519>329820</span> | <span class=lib25519>330725</span> | <span class=lib25519>108134</span> | <span class=lib25519>115296</span> | <span class=lib25519>388337</span> | <span class=lib25519>117125
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>66728</span> | <span class=lib25519>136513</span> | <span class=lib25519>136679</span> | <span class=lib25519>109065</span> | <span class=lib25519>116737</span> | <span class=lib25519>392035</span> | <span class=lib25519>115822
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>66998</span> | <span class=lib25519>136513</span> | <span class=lib25519>136634</span> | <span class=lib25519>109568</span> | <span class=lib25519>115893</span> | <span class=lib25519>387046</span> | <span class=lib25519>116484
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>67271</span> | <span class=s2n>136516</span> | | | | | |
| Skylake (2015) | <span class=openssl>OpenSSL</span> | <span class=openssl>130113</span> | <span class=openssl>118411</span> | | <span class=openssl>133656</span> | <span class=openssl>125076</span> | <span class=openssl>410342</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>29692</span> | <span class=lib25519>87876</span> | <span class=lib25519>63356</span> | <span class=lib25519>30487</span> | <span class=lib25519>34178</span> | <span class=lib25519>115932</span> | <span class=lib25519>37897
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>27768</span> | <span class=lib25519>82617</span> | <span class=lib25519>62859</span> | <span class=lib25519>28591</span> | <span class=lib25519>32066</span> | <span class=lib25519>102912</span> | <span class=lib25519>34192
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>27720</span> | <span class=lib25519>82538</span> | <span class=lib25519>62349</span> | <span class=lib25519>28548</span> | <span class=lib25519>31974</span> | <span class=lib25519>103861</span> | <span class=lib25519>33864
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>29632</span> | <span class=lib25519>91320</span> | <span class=lib25519>63021</span> | <span class=lib25519>30519</span> | <span class=lib25519>34153</span> | <span class=lib25519>116812</span> | <span class=lib25519>37771
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>28806</span> | <span class=s2n>84561</span> | | | | | |
| Airmont (2015) | <span class=openssl>OpenSSL</span> | <span class=openssl>294239</span> | <span class=openssl>619002</span> | | <span class=openssl>307282</span> | <span class=openssl>276812</span> | <span class=openssl>853664</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>143354</span> | <span class=lib25519>449531</span> | <span class=lib25519>453233</span> | <span class=lib25519>147006</span> | <span class=lib25519>162360</span> | <span class=lib25519>538729</span> | <span class=lib25519>155831
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>143469</span> | <span class=lib25519>449526</span> | <span class=lib25519>449664</span> | <span class=lib25519>147268</span> | <span class=lib25519>162544</span> | <span class=lib25519>545049</span> | <span class=lib25519>155471
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>115796</span> | <span class=lib25519>432250</span> | <span class=lib25519>432474</span> | <span class=lib25519>147040</span> | <span class=lib25519>162443</span> | <span class=lib25519>540996</span> | <span class=lib25519>155551
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>115310</span> | <span class=lib25519>431887</span> | <span class=lib25519>432423</span> | <span class=lib25519>147519</span> | <span class=lib25519>162521</span> | <span class=lib25519>534689</span> | <span class=lib25519>154865
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>116864</span> | <span class=s2n>432414</span> | | | | | |
| Broadwell (2014) | <span class=openssl>OpenSSL</span> | <span class=openssl>160005</span> | <span class=openssl>121255</span> | | <span class=openssl>164427</span> | <span class=openssl>120150</span> | <span class=openssl>392515</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>32283</span> | <span class=lib25519>98703</span> | <span class=lib25519>76275</span> | <span class=lib25519>32446</span> | <span class=lib25519>35978</span> | <span class=lib25519>122367</span> | <span class=lib25519>40335
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>29087</span> | <span class=lib25519>84887</span> | <span class=lib25519>72019</span> | <span class=lib25519>29798</span> | <span class=lib25519>33519</span> | <span class=lib25519>108336</span> | <span class=lib25519>34087
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>29072</span> | <span class=lib25519>85183</span> | <span class=lib25519>72074</span> | <span class=lib25519>29924</span> | <span class=lib25519>33656</span> | <span class=lib25519>108075</span> | <span class=lib25519>34176
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>31999</span> | <span class=lib25519>93402</span> | <span class=lib25519>75268</span> | <span class=lib25519>32349</span> | <span class=lib25519>35995</span> | <span class=lib25519>123093</span> | <span class=lib25519>39784
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>31396</span> | <span class=s2n>87934</span> | | | | | |
| Haswell (2013) | <span class=openssl>OpenSSL</span> | <span class=openssl>129719</span> | <span class=openssl>163429</span> | | <span class=openssl>133869</span> | <span class=openssl>126120</span> | <span class=openssl>409113</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>43651</span> | <span class=lib25519>118295</span> | <span class=lib25519>78589</span> | <span class=lib25519>44625</span> | <span class=lib25519>48554</span> | <span class=lib25519>152655</span> | <span class=lib25519>50027
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>41529</span> | <span class=lib25519>115343</span> | <span class=lib25519>76711</span> | <span class=lib25519>42391</span> | <span class=lib25519>46307</span> | <span class=lib25519>152299</span> | <span class=lib25519>51095
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>41622</span> | <span class=lib25519>115321</span> | <span class=lib25519>76639</span> | <span class=lib25519>42549</span> | <span class=lib25519>46292</span> | <span class=lib25519>152021</span> | <span class=lib25519>51281
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>43725</span> | <span class=lib25519>118643</span> | <span class=lib25519>78694</span> | <span class=lib25519>44474</span> | <span class=lib25519>48505</span> | <span class=lib25519>154119</span> | <span class=lib25519>50258
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>45860</span> | <span class=s2n>160318</span> | | | | | |
| Cortex-A53 (2012) | <span class=openssl>OpenSSL</span> | <span class=openssl>220649</span> | <span class=openssl>513705</span> | | <span class=openssl>228344</span> | <span class=openssl>194443</span> | <span class=openssl>537285</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>150257</span> | <span class=lib25519>464193</span> | <span class=lib25519>462874</span> | <span class=lib25519>152356</span> | <span class=lib25519>161604</span> | <span class=lib25519>514499</span> | <span class=lib25519>154920
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>149390</span> | <span class=lib25519>464490</span> | <span class=lib25519>463997</span> | <span class=lib25519>152091</span> | <span class=lib25519>161371</span> | <span class=lib25519>517547</span> | <span class=lib25519>153988
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>116303</span> | <span class=lib25519>163712</span> | <span class=lib25519>164737</span> | <span class=lib25519>151835</span> | <span class=lib25519>161198</span> | <span class=lib25519>518829</span> | <span class=lib25519>155405
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>116449</span> | <span class=lib25519>163004</span> | <span class=lib25519>164667</span> | <span class=lib25519>151644</span> | <span class=lib25519>161403</span> | <span class=lib25519>516001</span> | <span class=lib25519>155364
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>120158</span> | <span class=s2n>163155</span> | | | | | |
| Core 2 (2006) | <span class=openssl>OpenSSL</span> | <span class=openssl>260681</span> | <span class=openssl>337177</span> | | <span class=openssl>267882</span> | <span class=openssl>241408</span> | <span class=openssl>741945</span> | |
| | <span class=lib25519>lib25519</span> | <span class=lib25519>93286</span> | <span class=lib25519>300023</span> | <span class=lib25519>299458</span> | <span class=lib25519>96897</span> | <span class=lib25519>105719</span> | <span class=lib25519>350100</span> | <span class=lib25519>102180
| | <span class=lib25519>lib25519+exp</span> | <span class=lib25519>93748</span> | <span class=lib25519>300631</span> | <span class=lib25519>299729</span> | <span class=lib25519>97339</span> | <span class=lib25519>106421</span> | <span class=lib25519>353709</span> | <span class=lib25519>102230
| | <span class=lib25519>lib25519+s2n+exp</span> | <span class=lib25519>70996</span> | <span class=lib25519>262775</span> | <span class=lib25519>262533</span> | <span class=lib25519>97322</span> | <span class=lib25519>106036</span> | <span class=lib25519>355995</span> | <span class=lib25519>103031
| | <span class=lib25519>lib25519+s2n</span> | <span class=lib25519>71073</span> | <span class=lib25519>262945</span> | <span class=lib25519>262594</span> | <span class=lib25519>96803</span> | <span class=lib25519>105512</span> | <span class=lib25519>346167</span> | <span class=lib25519>102056
| | <span class=s2n>s2n-bignum</span> | <span class=s2n>78529</span> | <span class=s2n>262932</span> | | | | | |


Microarchitectures are listed in reverse chronological order of when they were introduced.
Each library is assigned one foreground color in the table.

In the lib25519 distribution,
`command/lib25519-speed.c` measures lib25519;
`benchmarks/*-*` is the output of `lib25519-speed` on various machines;
`speedcomparison/openssl/*` has code to measure OpenSSL, and measurements from various machines;
`speedcomparison/s2n/*` has code to measure s2n-bignum, and measurements from various machines;
and `autogen/md-speed` extracts the table from those measurements.
OpenSSL benchmarks use version 3.3.2 (2024.09.03);
s2n-bignum benchmarks use commit acbb18e6343f12a7944de72c1ec0991739600f8c (2024.03.18).

The table reports only median cycle counts;
see the full output files
for differences between multiple measurements and the median.
The table reports the following major operations:

* "X key": Generating an X25519 public key and secret key.
    This is `dh_x25519_keypair selected 32` in the `lib25519-speed` output
    (`lib25519_dh_keypair` in the stable API).

    For s2n-bignum,
    this is `x25519-keygen` in the `s2n25519speed` output,
    measuring the cost of `curve25519_x25519base_byte_alt`,
    or `curve25519_x25519base_byte` on machines where that works and is faster.

    For OpenSSL,
    this is `x25519-keygen-main` in the `openssl25519speed` output,
    measuring the cost of `EVP_PKEY_Q_keygen(0,0,"X25519")`.
    This does not include small OpenSSL overheads for converting the public key and secret key to storage format.

* "X dh":
    Generating an X25519 shared secret.
    This is `dh_x25519 selected 32` in the `lib25519-speed` output
    (`lib25519_dh` in the stable API).

    For s2n-bignum,
    this is `x25519-dh` in the `s2n25519speed` output,
    measuring the cost of `curve25519_x25519_byte_alt`,
    or `curve25519_x25519_byte` on machines where that works and is faster.

    For OpenSSL,
    this is `x25519-dh-main` in the `openssl25519speed` output,
    measuring the cost of `EVP_PKEY_derive`
    (as in OpenSSL's speed-testing utility).
    This does not include the cost of `EVP_PKEY_new_raw_public_key`
    to decode the public key (`x25519-dh-pkdecode`, 6836 cycles on Tiger Lake),
    `EVP_PKEY_CTX_new` and `EVP_PKEY_derive_init` and `EVP_PKEY_derive_set_peer` for initialization
    (together `x25519-dh-init`, 2423 cycles on Tiger Lake),
    and 
    `EVP_PKEY_new_raw_private_key` to decode the secret key if it is not decoded already
    (`x25519-dh-skdecode`, 112114 cycles on Tiger Lake).

* "X batch":
    Cost _per secret_ of generating 16 separate shared secrets.
    This is `nPbatch_montgomery25519 selected 16` in the `lib25519-speed` output _divided by 16_.

* "Ed key": Generating an Ed25519 public key and secret key.
    This is `sign_ed25519_keypair selected 32` in the `lib25519-speed` output
    (`lib25519_sign_keypair` in the stable API).

    For OpenSSL,
    this is `ed25519-keygen-main` in the `openssl25519speed` output,
    measuring the cost of `EVP_PKEY_Q_keygen(0,0,"ED25519")`.
    This does not include small OpenSSL overheads for converting the public key and secret key to storage format.

* "Ed sign": Generating an Ed25519 signature of a 59-byte message.
    This is `sign_ed25519 selected 59` in the `lib25519-speed` output
    (`lib25519_sign` in the stable API).

    For OpenSSL,
    this is `ed25519-sign-main` in the `openssl25519speed` output,
    measuring the cost of `EVP_DigestSign`
    (as in OpenSSL's speed-testing utility).
    This does not include the cost of 
    `EVP_MD_CTX_new` and
    `EVP_DigestSignInit`
    (`ed25519-sign-init`, 2808 cycles on Tiger Lake),
    and `EVP_PKEY_new_raw_private_key` to decode the secret key if it is not decoded already
    (`ed25519-sign-skdecode`, 114894 cycles on Tiger Lake).

* "Ed verif": Verifying an Ed25519 signature and recovering a 59-byte message.
    This is `sign_ed25519_open selected 59` in the `lib25519-speed` output
    (`lib25519_sign_open` in the stable API).

    For OpenSSL,
    this is `ed25519-verify-main` in the `openssl25519speed` output,
    measuring the cost of `EVP_DigestVerify`
    (as in OpenSSL's speed-testing utility).
    This does not include the cost of 
    `EVP_MD_CTX_new` and
    `EVP_DigestVerifyInit`
    (together `ed25519-verify-init`, 2579 cycles on Tiger Lake),
    and `EVP_PKEY_new_raw_public_key`
    to decode the public key being used for verification
    (`ed25519-verify-pkdecode`, 7401 cycles on Tiger Lake).

* "Ed MSM": Cost _per point_ of multi-scalar multiplication with 16 points and 16 full-size scalars.
    This is `multiscalar_ed25519 selected 16` in the `lib25519-speed` output _divided by 16_.
