.class public LU3/a;
.super Landroidx/preference/c;
.source "PreferenceGroupAdapter.java"


# instance fields
.field private final g:Z

.field private h:I


# direct methods
.method public constructor <init>(Landroidx/preference/PreferenceGroup;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Landroidx/preference/c;-><init>(Landroidx/preference/PreferenceGroup;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, LU3/a;->g:Z

    .line 6
    .line 7
    return-void
.end method

.method private n(Landroidx/preference/h;I)V
    .locals 28

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const v3, 0x1020006

    .line 1
    invoke-virtual {v1, v3}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 2
    iget-object v4, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 3
    iget-object v5, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    .line 4
    sget v6, LR3/e;->Z:I

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    .line 5
    sget v7, LR3/e;->R:I

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    .line 6
    sget v8, LR3/e;->Q:I

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    .line 7
    sget v9, LR3/e;->S:I

    invoke-virtual {v4, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 8
    sget v10, LR3/e;->M:I

    invoke-virtual {v4, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .line 9
    sget v11, LR3/e;->d0:I

    invoke-virtual {v4, v11}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v11

    .line 10
    sget v12, LR3/e;->e0:I

    invoke-virtual {v4, v12}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v12

    .line 11
    sget v13, LR3/e;->J:I

    invoke-virtual {v4, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    .line 12
    invoke-virtual {v0, v2}, Landroidx/preference/c;->i(I)Landroidx/preference/Preference;

    move-result-object v14

    .line 13
    invoke-virtual {v14}, Landroidx/preference/Preference;->I()Ljava/lang/CharSequence;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    move-object/from16 v16, v3

    .line 14
    invoke-virtual {v14}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    move-result-object v3

    .line 15
    invoke-static {v5}, Lb4/g;->h(Landroid/content/Context;)Z

    move-result v17

    move/from16 v18, v7

    .line 16
    instance-of v7, v14, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    move/from16 v19, v7

    if-eqz v19, :cond_0

    .line 17
    move-object/from16 v20, v14

    check-cast v20, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 18
    invoke-virtual/range {v20 .. v20}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->U0()Z

    move-result v21

    .line 19
    invoke-virtual/range {v20 .. v20}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->V0()Landroid/graphics/drawable/Drawable;

    move-result-object v22

    .line 20
    invoke-virtual/range {v20 .. v20}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->W0()Ljava/lang/String;

    move-result-object v23

    .line 21
    invoke-virtual/range {v20 .. v20}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->getNumber()I

    move-result v24

    .line 22
    invoke-virtual/range {v20 .. v20}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->X0()Z

    move-result v20

    move/from16 v25, v21

    move/from16 v7, v24

    move/from16 v21, v10

    move/from16 v24, v13

    move-object/from16 v13, v22

    move-object/from16 v22, v5

    move-object/from16 v5, v23

    move/from16 v23, v20

    goto/16 :goto_7

    .line 23
    :cond_0
    instance-of v7, v14, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;

    if-eqz v7, :cond_1

    .line 24
    move-object v7, v14

    check-cast v7, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;

    .line 25
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;->U0()Z

    move-result v21

    .line 26
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;->V0()Landroid/graphics/drawable/Drawable;

    move-result-object v22

    .line 27
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;->W0()Ljava/lang/String;

    move-result-object v23

    .line 28
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;->getNumber()I

    move-result v24

    .line 29
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;->Y0()Z

    move-result v7

    move-object/from16 v25, v22

    move-object/from16 v22, v5

    move-object/from16 v5, v23

    move/from16 v23, v7

    move/from16 v7, v24

    move/from16 v24, v13

    move-object/from16 v13, v25

    move/from16 v25, v21

    move/from16 v21, v10

    goto/16 :goto_7

    .line 30
    :cond_1
    instance-of v7, v14, Landroidx/preference/CheckBoxPreference;

    const/16 v22, 0x0

    const-string v23, ""

    if-eqz v7, :cond_3

    .line 31
    move-object v7, v14

    check-cast v7, Landroidx/preference/CheckBoxPreference;

    .line 32
    invoke-virtual {v7}, Landroidx/preference/Preference;->m()Landroid/os/Bundle;

    move-result-object v7

    move/from16 v21, v10

    if-eqz v7, :cond_2

    .line 33
    const-string v10, "mNumber"

    move/from16 v24, v13

    const/4 v13, -0x2

    invoke-virtual {v7, v10, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    goto :goto_0

    :cond_2
    move/from16 v24, v13

    const/4 v7, -0x2

    :goto_0
    move-object/from16 v13, v22

    :goto_1
    const/16 v25, 0x1

    :goto_2
    move-object/from16 v22, v5

    move-object/from16 v5, v23

    const/16 v23, 0x1

    goto/16 :goto_7

    :cond_3
    move/from16 v21, v10

    move/from16 v24, v13

    .line 34
    instance-of v7, v14, Lcom/zte/mifavor/androidx/preference/SwitchPreferenceZTE;

    if-eqz v7, :cond_7

    .line 35
    move-object v7, v14

    check-cast v7, Lcom/zte/mifavor/androidx/preference/SwitchPreferenceZTE;

    .line 36
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/SwitchPreferenceZTE;->f1()Z

    move-result v10

    .line 37
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/SwitchPreferenceZTE;->getNumber()I

    move-result v13

    .line 38
    invoke-static {}, Lcom/zte/mifavor/widget/u;->s()Z

    move-result v25

    if-nez v25, :cond_6

    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/SwitchPreferenceZTE;->h1()Z

    move-result v25

    if-nez v25, :cond_6

    move-object/from16 v25, v7

    .line 39
    iget-object v7, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->hasOnClickListeners()Z

    move-result v7

    if-nez v7, :cond_4

    goto :goto_3

    .line 40
    :cond_4
    invoke-virtual/range {v25 .. v25}, Landroidx/preference/Preference;->w()Landroidx/preference/Preference$e;

    move-result-object v7

    if-nez v7, :cond_5

    goto :goto_3

    .line 41
    :cond_5
    invoke-virtual/range {v25 .. v25}, Landroidx/preference/Preference;->v()Landroidx/preference/Preference$d;

    :cond_6
    :goto_3
    move/from16 v25, v10

    move v7, v13

    :goto_4
    move-object/from16 v13, v22

    goto :goto_2

    .line 42
    :cond_7
    instance-of v7, v14, Landroidx/preference/SwitchPreference;

    if-eqz v7, :cond_9

    .line 43
    move-object v7, v14

    check-cast v7, Landroidx/preference/SwitchPreference;

    .line 44
    invoke-static {}, Lcom/zte/mifavor/widget/u;->s()Z

    move-result v10

    if-nez v10, :cond_c

    .line 45
    invoke-virtual {v7}, Landroidx/preference/Preference;->w()Landroidx/preference/Preference$e;

    move-result-object v10

    if-nez v10, :cond_8

    .line 46
    new-instance v10, LU3/a$a;

    invoke-direct {v10, v0, v5}, LU3/a$a;-><init>(LU3/a;Landroid/content/Context;)V

    invoke-virtual {v7, v10}, Landroidx/preference/Preference;->F0(Landroidx/preference/Preference$e;)V

    goto :goto_6

    .line 47
    :cond_8
    invoke-virtual {v7}, Landroidx/preference/Preference;->v()Landroidx/preference/Preference$d;

    goto :goto_6

    .line 48
    :cond_9
    instance-of v7, v14, Lcom/zte/mifavor/androidx/preference/PreferenceCategoryZTE;

    if-eqz v7, :cond_a

    .line 49
    move-object v7, v14

    check-cast v7, Lcom/zte/mifavor/androidx/preference/PreferenceCategoryZTE;

    .line 50
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/PreferenceCategoryZTE;->j1()Z

    move-result v7

    move/from16 v25, v7

    move-object/from16 v13, v22

    const/4 v7, -0x2

    goto :goto_2

    .line 51
    :cond_a
    instance-of v7, v14, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;

    if-eqz v7, :cond_b

    .line 52
    move-object v7, v14

    check-cast v7, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;

    .line 53
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->h1()Z

    move-result v10

    .line 54
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->getNumber()I

    move-result v7

    :goto_5
    move/from16 v25, v10

    goto :goto_4

    .line 55
    :cond_b
    instance-of v7, v14, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;

    if-eqz v7, :cond_c

    .line 56
    move-object v7, v14

    check-cast v7, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;

    .line 57
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->h1()Z

    move-result v10

    .line 58
    invoke-virtual {v7}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->getNumber()I

    move-result v7

    goto :goto_5

    :cond_c
    :goto_6
    move-object/from16 v13, v22

    const/4 v7, -0x2

    goto/16 :goto_1

    .line 59
    :goto_7
    const-string v10, "ZBLUETOOTH_"

    move/from16 v26, v9

    const/4 v9, 0x0

    if-nez v25, :cond_20

    .line 60
    instance-of v5, v14, Lcom/zte/mifavor/androidx/preference/PreferenceCategoryZTE;

    if-eqz v5, :cond_12

    .line 61
    sget v0, LR3/g;->C0:I

    invoke-virtual {v1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v0

    const/16 v5, 0x8

    if-eqz v0, :cond_d

    .line 62
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 63
    :cond_d
    sget v0, LR3/g;->C:I

    invoke-virtual {v1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_f

    if-nez v2, :cond_e

    .line 64
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_8

    .line 65
    :cond_e
    invoke-virtual {v0, v9}, Landroid/view/View;->setVisibility(I)V

    .line 66
    :cond_f
    :goto_8
    sget v0, LR3/g;->B0:I

    invoke-virtual {v1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 67
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 68
    :cond_10
    sget v0, LR3/g;->a0:I

    invoke-virtual {v1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 69
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 70
    :cond_11
    sget v0, LR3/g;->B:I

    invoke-virtual {v1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_68

    .line 71
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_12
    const/16 v5, 0x8

    if-eqz v16, :cond_17

    .line 72
    invoke-virtual/range {v16 .. v16}, Landroid/widget/ImageView;->getVisibility()I

    move-result v2

    if-eq v2, v5, :cond_17

    invoke-virtual/range {v16 .. v16}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_17

    .line 73
    sget v2, LR3/e;->O:I

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 74
    invoke-virtual/range {v16 .. v16}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v5

    mul-int/lit8 v6, v21, 0x2

    sub-int v6, v2, v6

    if-lt v5, v6, :cond_13

    const/4 v5, 0x1

    goto :goto_9

    :cond_13
    move v5, v9

    .line 75
    :goto_9
    invoke-virtual/range {v16 .. v16}, Landroid/widget/ImageView;->getMaxWidth()I

    move-result v7

    if-lt v7, v6, :cond_14

    const/4 v7, 0x1

    goto :goto_a

    :cond_14
    move v7, v9

    :goto_a
    and-int/2addr v5, v7

    .line 76
    iget v6, v0, LU3/a;->h:I

    if-lez v6, :cond_15

    :goto_b
    const v2, 0x102003e

    goto :goto_d

    :cond_15
    if-eqz v5, :cond_16

    :goto_c
    sub-int v6, v2, v21

    goto :goto_b

    .line 77
    :cond_16
    sget v2, LR3/e;->n:I

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_c

    :cond_17
    move v5, v9

    move v6, v5

    goto :goto_b

    .line 78
    :goto_d
    invoke-virtual {v1, v2}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_19

    .line 79
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    if-gtz v6, :cond_18

    const/4 v7, -0x2

    .line 80
    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    goto :goto_e

    .line 81
    :cond_18
    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 82
    :goto_e
    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    :cond_19
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v4, LR3/e;->k:I

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 84
    iget-object v4, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v4

    sget v6, LR3/g;->o:I

    if-ne v4, v6, :cond_1d

    .line 85
    sget v4, LR3/g;->p0:I

    invoke-virtual {v1, v4}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v4

    const v6, 0x1020010

    .line 86
    invoke-virtual {v1, v6}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v6

    const v7, 0x1020016

    .line 87
    invoke-virtual {v1, v7}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v7

    .line 88
    invoke-direct {v0, v7, v6, v4}, LU3/a;->s(Landroid/view/View;Landroid/view/View;Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 89
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, LR3/e;->o:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_f

    :cond_1a
    if-eqz v5, :cond_1b

    .line 90
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, LR3/e;->m:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    :cond_1b
    :goto_f
    if-eqz v2, :cond_1d

    if-eqz v23, :cond_1d

    if-eqz v3, :cond_1c

    .line 91
    invoke-virtual {v3, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 92
    :cond_1c
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setMinimumHeight(I)V

    .line 93
    :cond_1d
    sget v0, LR3/g;->G:I

    invoke-virtual {v1, v0}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1e

    .line 94
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v5, 0x8

    if-eq v0, v5, :cond_1e

    .line 95
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, v11, v9, v12, v9}, Landroid/view/View;->setPaddingRelative(IIII)V

    :cond_1e
    if-eqz v13, :cond_1f

    .line 96
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, v13}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    .line 97
    :cond_1f
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v1, LR3/f;->i:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    .line 98
    :cond_20
    instance-of v12, v14, Landroidx/preference/PreferenceCategory;

    if-nez v12, :cond_52

    instance-of v12, v14, Lcom/zte/mifavor/androidx/preference/PreferenceCategoryZTE;

    if-eqz v12, :cond_21

    goto/16 :goto_23

    :cond_21
    const/4 v8, -0x1

    if-eq v8, v7, :cond_68

    .line 99
    invoke-virtual {v14}, Landroidx/preference/Preference;->P()Z

    move-result v8

    if-eqz v8, :cond_68

    if-eqz v3, :cond_22

    const-string v8, "hidemyself"

    invoke-virtual {v3, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_68

    :cond_22
    if-eqz v15, :cond_23

    const-string v8, " "

    invoke-virtual {v15, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_23

    goto/16 :goto_2a

    :cond_23
    if-eqz v16, :cond_2a

    .line 100
    invoke-virtual/range {v16 .. v16}, Landroid/widget/ImageView;->getVisibility()I

    move-result v8

    const/16 v12, 0x8

    if-eq v8, v12, :cond_2a

    invoke-virtual/range {v16 .. v16}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    if-eqz v8, :cond_2a

    .line 101
    sget v8, LR3/e;->O:I

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    .line 102
    invoke-virtual/range {v16 .. v16}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v12

    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v12

    mul-int/lit8 v13, v21, 0x2

    sub-int v13, v8, v13

    if-lt v12, v13, :cond_24

    const/4 v12, 0x1

    goto :goto_10

    :cond_24
    move v12, v9

    .line 103
    :goto_10
    invoke-virtual/range {v16 .. v16}, Landroid/widget/ImageView;->getMaxWidth()I

    move-result v15

    if-lt v15, v13, :cond_25

    const/4 v13, 0x1

    goto :goto_11

    :cond_25
    move v13, v9

    :goto_11
    and-int/2addr v12, v13

    .line 104
    iget v13, v0, LU3/a;->h:I

    if-lez v13, :cond_26

    :goto_12
    const v4, 0x102003e

    goto :goto_13

    :cond_26
    if-eqz v12, :cond_27

    sub-int v13, v8, v21

    goto :goto_12

    :cond_27
    if-eqz v3, :cond_28

    .line 105
    const-string v8, "icon24"

    invoke-virtual {v3, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_28

    .line 106
    sget v8, LR3/e;->i:I

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    goto :goto_12

    :cond_28
    if-eqz v3, :cond_29

    .line 107
    const-string v8, "icon40"

    invoke-virtual {v3, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_29

    .line 108
    sget v8, LR3/e;->j:I

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v13

    goto :goto_12

    .line 109
    :cond_29
    sget v8, LR3/e;->n:I

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    sub-int v13, v4, v21

    goto :goto_12

    :cond_2a
    move v12, v9

    move v13, v12

    goto :goto_12

    .line 110
    :goto_13
    invoke-virtual {v1, v4}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_2c

    .line 111
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout$LayoutParams;

    if-gtz v13, :cond_2b

    const/4 v15, -0x2

    .line 112
    iput v15, v8, Landroid/widget/LinearLayout$LayoutParams;->width:I

    goto :goto_14

    .line 113
    :cond_2b
    iput v13, v8, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 114
    :goto_14
    invoke-virtual {v4, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    :cond_2c
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v8, LR3/e;->m:I

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 116
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v13, LR3/e;->o:I

    invoke-virtual {v4, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 117
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v15, LR3/e;->k:I

    invoke-virtual {v4, v15}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 118
    iget-object v15, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v15}, Landroid/view/View;->getId()I

    move-result v15

    sget v9, LR3/g;->o:I

    if-eq v15, v9, :cond_32

    iget-object v9, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getId()I

    move-result v9

    sget v15, LR3/g;->s:I

    if-ne v9, v15, :cond_2d

    goto :goto_16

    .line 119
    :cond_2d
    iget-object v8, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getId()I

    move-result v8

    sget v9, LR3/g;->b0:I

    if-ne v8, v9, :cond_2f

    :cond_2e
    move/from16 v4, v18

    goto/16 :goto_17

    .line 120
    :cond_2f
    iget-object v8, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getId()I

    move-result v8

    sget v9, LR3/g;->N:I

    if-eq v8, v9, :cond_31

    if-eqz v3, :cond_30

    const-string v8, "zte_eyecare_seek"

    invoke-virtual {v3, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_31

    const-string v8, "zte_white_weaken"

    invoke-virtual {v3, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_30

    goto :goto_15

    :cond_30
    if-eqz v3, :cond_35

    .line 121
    const-string v8, "appslist_nfc_pay"

    invoke-virtual {v3, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_35

    .line 122
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v8, LR3/e;->l:I

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    goto :goto_17

    :cond_31
    :goto_15
    const/4 v4, 0x0

    goto :goto_17

    .line 123
    :cond_32
    :goto_16
    sget v9, LR3/g;->p0:I

    invoke-virtual {v1, v9}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v9

    const v15, 0x1020010

    .line 124
    invoke-virtual {v1, v15}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v15

    move/from16 v18, v4

    const v4, 0x1020016

    .line 125
    invoke-virtual {v1, v4}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v4

    .line 126
    invoke-direct {v0, v4, v15, v9}, LU3/a;->s(Landroid/view/View;Landroid/view/View;Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_33

    .line 127
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v13}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    goto :goto_17

    :cond_33
    if-eqz v12, :cond_34

    .line 128
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    goto :goto_17

    .line 129
    :cond_34
    iget-object v4, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getId()I

    move-result v4

    sget v9, LR3/g;->s:I

    if-ne v4, v9, :cond_2e

    .line 130
    invoke-virtual/range {v22 .. v22}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    :cond_35
    :goto_17
    if-eqz v4, :cond_37

    if-eqz v23, :cond_37

    if-eqz v3, :cond_36

    .line 131
    invoke-virtual {v3, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_37

    .line 132
    :cond_36
    iget-object v8, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v8, v4}, Landroid/view/View;->setMinimumHeight(I)V

    .line 133
    :cond_37
    sget v4, LR3/g;->G:I

    invoke-virtual {v1, v4}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v4

    .line 134
    sget v8, LR3/g;->h0:I

    invoke-virtual {v1, v8}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v8

    if-nez v19, :cond_38

    .line 135
    instance-of v9, v14, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;

    if-eqz v9, :cond_39

    :cond_38
    if-eqz v5, :cond_39

    const-string v9, "BIGICON"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3a

    :cond_39
    if-eqz v3, :cond_3b

    const-string v5, "app_data_usage"

    .line 136
    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3b

    :cond_3a
    const/4 v3, 0x1

    goto :goto_18

    :cond_3b
    const/4 v3, 0x0

    :goto_18
    const/4 v5, 0x2

    if-eqz v4, :cond_3d

    .line 137
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v9, 0x8

    if-eq v4, v9, :cond_3d

    if-nez v3, :cond_3d

    if-nez v12, :cond_3d

    if-nez v17, :cond_3c

    goto :goto_19

    :cond_3c
    add-int/lit8 v11, v11, -0xe

    .line 138
    :goto_19
    iget-object v3, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    mul-int/lit8 v13, v24, 0x2

    const/4 v4, 0x0

    invoke-virtual {v3, v13, v4, v11, v4}, Landroid/view/View;->setPaddingRelative(IIII)V

    goto :goto_1b

    :cond_3d
    if-eqz v8, :cond_3e

    .line 139
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v9, 0x8

    if-eq v4, v9, :cond_3e

    if-nez v3, :cond_3e

    if-nez v12, :cond_3e

    .line 140
    iget-object v3, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    mul-int/lit8 v13, v24, 0x2

    const/4 v4, 0x0

    invoke-virtual {v3, v13, v4, v6, v4}, Landroid/view/View;->setPaddingRelative(IIII)V

    goto :goto_1b

    :cond_3e
    const/4 v4, 0x0

    if-nez v3, :cond_40

    if-eqz v12, :cond_3f

    goto :goto_1a

    .line 141
    :cond_3f
    iget-object v3, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    mul-int/lit8 v13, v24, 0x2

    invoke-virtual {v3, v13, v4, v13, v4}, Landroid/view/View;->setPaddingRelative(IIII)V

    goto :goto_1b

    .line 142
    :cond_40
    :goto_1a
    iget-object v3, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v3, v11, v4, v6, v4}, Landroid/view/View;->setPaddingRelative(IIII)V

    .line 143
    :goto_1b
    invoke-virtual {v14}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    move-result-object v3

    if-eqz v3, :cond_41

    .line 144
    invoke-virtual {v3}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 145
    :cond_41
    instance-of v4, v3, Landroidx/preference/PreferenceCategory;

    const/4 v6, 0x3

    if-lez v2, :cond_4a

    if-nez v4, :cond_4a

    .line 146
    invoke-direct {v0, v14}, LU3/a;->q(Landroidx/preference/Preference;)Landroidx/preference/Preference;

    move-result-object v2

    .line 147
    invoke-direct {v0, v14}, LU3/a;->p(Landroidx/preference/Preference;)Landroidx/preference/Preference;

    move-result-object v0

    .line 148
    instance-of v2, v2, Landroidx/preference/PreferenceCategory;

    .line 149
    instance-of v0, v0, Landroidx/preference/PreferenceCategory;

    if-eq v5, v7, :cond_48

    const/4 v13, -0x2

    if-ne v13, v7, :cond_42

    if-nez v2, :cond_42

    if-nez v0, :cond_42

    goto :goto_1e

    :cond_42
    if-eqz v7, :cond_47

    if-ne v13, v7, :cond_43

    if-eqz v2, :cond_43

    if-eqz v0, :cond_43

    goto :goto_1d

    :cond_43
    const/4 v3, 0x1

    if-eq v3, v7, :cond_46

    if-ne v13, v7, :cond_44

    if-eqz v2, :cond_44

    if-nez v0, :cond_44

    goto :goto_1c

    :cond_44
    if-eq v6, v7, :cond_45

    if-ne v13, v7, :cond_49

    if-nez v2, :cond_49

    if-eqz v0, :cond_49

    .line 150
    :cond_45
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v1, LR3/f;->k:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1f

    .line 151
    :cond_46
    :goto_1c
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v1, LR3/f;->n:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1f

    .line 152
    :cond_47
    :goto_1d
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v1, LR3/f;->m:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1f

    .line 153
    :cond_48
    :goto_1e
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v1, LR3/f;->l:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    :cond_49
    :goto_1f
    return-void

    :cond_4a
    if-eqz v3, :cond_68

    if-eqz v4, :cond_68

    .line 154
    invoke-virtual {v14}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    move-result-object v0

    check-cast v0, Landroidx/preference/PreferenceCategory;

    .line 155
    invoke-virtual {v0}, Landroidx/preference/PreferenceGroup;->a1()I

    move-result v2

    if-eqz v7, :cond_51

    const/4 v3, 0x1

    const/4 v13, -0x2

    if-ne v2, v3, :cond_4b

    if-ne v13, v7, :cond_4b

    goto :goto_22

    :cond_4b
    if-lt v2, v3, :cond_68

    if-eq v3, v7, :cond_50

    const/4 v4, 0x0

    .line 156
    invoke-virtual {v0, v4}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    move-result-object v4

    if-ne v14, v4, :cond_4c

    if-ne v13, v7, :cond_4c

    goto :goto_21

    :cond_4c
    if-eq v6, v7, :cond_4f

    sub-int/2addr v2, v3

    .line 157
    invoke-virtual {v0, v2}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    move-result-object v0

    if-ne v14, v0, :cond_4d

    if-ne v13, v7, :cond_4d

    goto :goto_20

    :cond_4d
    if-ne v5, v7, :cond_4e

    .line 158
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v1, LR3/f;->l:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    .line 159
    :cond_4e
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v1, LR3/f;->l:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    .line 160
    :cond_4f
    :goto_20
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v1, LR3/f;->k:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    .line 161
    :cond_50
    :goto_21
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v1, LR3/f;->n:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    .line 162
    :cond_51
    :goto_22
    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v1, LR3/f;->m:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    .line 163
    :cond_52
    :goto_23
    move-object v4, v14

    check-cast v4, Landroidx/preference/PreferenceCategory;

    invoke-virtual {v4}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 164
    invoke-virtual {v1}, Landroidx/preference/h;->b()Z

    move-result v4

    .line 165
    invoke-virtual {v1}, Landroidx/preference/h;->c()Z

    move-result v6

    .line 166
    instance-of v7, v14, Lcom/zte/mifavor/androidx/preference/PreferenceCategoryZTE;

    if-eqz v7, :cond_53

    .line 167
    move-object v4, v14

    check-cast v4, Lcom/zte/mifavor/androidx/preference/PreferenceCategoryZTE;

    .line 168
    invoke-virtual {v4}, Lcom/zte/mifavor/androidx/preference/PreferenceCategoryZTE;->m1()Z

    move-result v5

    .line 169
    invoke-virtual {v4}, Lcom/zte/mifavor/androidx/preference/PreferenceCategoryZTE;->n1()Z

    move-result v6

    .line 170
    invoke-virtual {v4}, Lcom/zte/mifavor/androidx/preference/PreferenceCategoryZTE;->k1()Ljava/lang/String;

    move-result-object v4

    move/from16 v27, v5

    move-object v5, v4

    move/from16 v4, v27

    .line 171
    :cond_53
    sget v9, LR3/g;->C0:I

    invoke-virtual {v1, v9}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v9

    const/16 v12, 0x8

    if-eqz v9, :cond_54

    .line 172
    invoke-virtual {v9, v12}, Landroid/view/View;->setVisibility(I)V

    .line 173
    :cond_54
    sget v9, LR3/g;->C:I

    invoke-virtual {v1, v9}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v9

    if-eqz v9, :cond_55

    .line 174
    invoke-virtual {v9, v12}, Landroid/view/View;->setVisibility(I)V

    .line 175
    :cond_55
    sget v9, LR3/g;->a0:I

    invoke-virtual {v1, v9}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v9

    .line 176
    sget v10, LR3/g;->B:I

    invoke-virtual {v1, v10}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v10

    .line 177
    sget v12, LR3/g;->B0:I

    invoke-virtual {v1, v12}, Landroidx/preference/h;->a(I)Landroid/view/View;

    move-result-object v1

    .line 178
    const-string v12, "noplaceholder"

    if-eqz v7, :cond_56

    if-eqz v5, :cond_56

    .line 179
    invoke-virtual {v5, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_56

    const/4 v5, 0x1

    goto :goto_24

    :cond_56
    const/4 v5, 0x0

    :goto_24
    if-eqz v3, :cond_57

    .line 180
    invoke-virtual {v3, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_58

    :cond_57
    if-eqz v5, :cond_59

    :cond_58
    const/4 v5, 0x1

    goto :goto_25

    :cond_59
    const/4 v5, 0x0

    :goto_25
    if-eqz v3, :cond_5a

    .line 181
    const-string v7, "needplaceholder"

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5a

    const/4 v3, 0x1

    goto :goto_26

    :cond_5a
    const/4 v3, 0x0

    :goto_26
    if-eqz v5, :cond_5b

    if-eqz v9, :cond_5b

    const/16 v5, 0x8

    .line 182
    invoke-virtual {v9, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_28

    :cond_5b
    if-eqz v3, :cond_5c

    if-eqz v9, :cond_5c

    .line 183
    invoke-direct {v0, v9, v8}, LU3/a;->t(Landroid/view/View;I)V

    :goto_27
    const/16 v5, 0x8

    goto :goto_28

    :cond_5c
    const/4 v5, 0x1

    if-gt v2, v5, :cond_5e

    if-eqz v4, :cond_5e

    if-nez v6, :cond_5e

    if-eqz v9, :cond_5e

    if-eqz v15, :cond_5d

    .line 184
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v5, :cond_5d

    const/16 v5, 0x8

    .line 185
    invoke-virtual {v9, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_28

    .line 186
    :cond_5d
    invoke-direct {v0, v9, v8}, LU3/a;->t(Landroid/view/View;I)V

    goto :goto_27

    :cond_5e
    if-eqz v4, :cond_5f

    if-eqz v9, :cond_5f

    move/from16 v2, v26

    .line 187
    invoke-direct {v0, v9, v2}, LU3/a;->t(Landroid/view/View;I)V

    goto :goto_27

    :cond_5f
    if-nez v4, :cond_60

    if-eqz v6, :cond_60

    .line 188
    invoke-direct {v0, v14}, LU3/a;->r(Landroidx/preference/Preference;)Z

    move-result v2

    if-eqz v2, :cond_60

    if-eqz v9, :cond_60

    .line 189
    invoke-direct {v0, v9, v11}, LU3/a;->t(Landroid/view/View;I)V

    goto :goto_27

    :cond_60
    const/16 v5, 0x8

    if-eqz v9, :cond_61

    .line 190
    invoke-virtual {v9, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_61
    :goto_28
    if-nez v4, :cond_64

    if-nez v6, :cond_64

    if-eqz v10, :cond_62

    .line 191
    invoke-virtual {v10, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_62
    if-eqz v1, :cond_63

    .line 192
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_63
    if-eqz v9, :cond_68

    if-nez v3, :cond_68

    .line 193
    invoke-virtual {v9, v5}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_64
    if-eqz v10, :cond_66

    if-eqz v4, :cond_65

    const/4 v4, 0x0

    .line 194
    invoke-virtual {v10, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_29

    :cond_65
    const/4 v4, 0x0

    .line 195
    invoke-virtual {v10, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_29

    :cond_66
    const/4 v4, 0x0

    :goto_29
    if-eqz v1, :cond_68

    if-eqz v6, :cond_67

    .line 196
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    return-void

    .line 197
    :cond_67
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_68
    :goto_2a
    return-void
.end method

.method private o(Landroidx/preference/Preference;)I
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/preference/PreferenceZTE;->getNumber()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    instance-of p0, p1, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    check-cast p1, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/preference/PreferenceZTEX;->getNumber()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    instance-of p0, p1, Lcom/zte/mifavor/androidx/preference/SwitchPreferenceZTE;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    check-cast p1, Lcom/zte/mifavor/androidx/preference/SwitchPreferenceZTE;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/preference/SwitchPreferenceZTE;->getNumber()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_2
    instance-of p0, p1, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;

    .line 35
    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    check-cast p1, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTEX;->getNumber()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_3
    instance-of p0, p1, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    check-cast p1, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/zte/mifavor/androidx/preference/ListPreferenceZTE;->getNumber()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0

    .line 56
    :cond_4
    const/4 p0, -0x2

    .line 57
    return p0
.end method

.method private p(Landroidx/preference/Preference;)Landroidx/preference/Preference;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {v1}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception p0

    .line 18
    goto :goto_3

    .line 19
    :cond_1
    move v1, v2

    .line 20
    :goto_0
    move v3, v2

    .line 21
    move v4, v3

    .line 22
    :goto_1
    if-ge v2, v1, :cond_5

    .line 23
    .line 24
    invoke-virtual {p1}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    invoke-virtual {v5, v2}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    if-ne v5, v6, :cond_2

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    move v4, v3

    .line 44
    move v3, v2

    .line 45
    goto :goto_2

    .line 46
    :cond_2
    invoke-direct {p0, v0}, LU3/a;->o(Landroidx/preference/Preference;)I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    const/4 v6, -0x1

    .line 51
    if-eqz v4, :cond_3

    .line 52
    .line 53
    invoke-virtual {p1}, Landroidx/preference/Preference;->P()Z

    .line 54
    .line 55
    .line 56
    move-result v7

    .line 57
    if-eqz v7, :cond_4

    .line 58
    .line 59
    if-ne v6, v5, :cond_3

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    if-eqz v4, :cond_4

    .line 63
    .line 64
    invoke-virtual {p1}, Landroidx/preference/Preference;->P()Z

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    if-eqz v7, :cond_4

    .line 69
    .line 70
    if-eq v6, v5, :cond_4

    .line 71
    .line 72
    return-object v0

    .line 73
    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_5
    invoke-virtual {p1}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    if-eqz p0, :cond_6

    .line 81
    .line 82
    invoke-virtual {p0, v3}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    .line 83
    .line 84
    .line 85
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    return-object p0

    .line 87
    :cond_6
    return-object v0

    .line 88
    :goto_3
    const-string p1, "XPG#Adapter"

    .line 89
    .line 90
    const-string v1, "get Post Visible Preference error. e="

    .line 91
    .line 92
    invoke-static {p1, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 93
    .line 94
    .line 95
    return-object v0
.end method

.method private q(Landroidx/preference/Preference;)Landroidx/preference/Preference;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 10
    .line 11
    .line 12
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    goto :goto_0

    .line 14
    :catch_0
    move-exception p0

    .line 15
    goto :goto_5

    .line 16
    :cond_0
    move v1, v2

    .line 17
    :goto_0
    move-object v4, v0

    .line 18
    move v3, v2

    .line 19
    :goto_1
    if-ge v3, v1, :cond_2

    .line 20
    .line 21
    :try_start_1
    invoke-virtual {p1}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    invoke-virtual {v5, v3}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    invoke-virtual {v4}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 37
    if-ne v5, v6, :cond_1

    .line 38
    .line 39
    move v2, v3

    .line 40
    goto :goto_2

    .line 41
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :catch_1
    move-exception p0

    .line 45
    move-object v0, v4

    .line 46
    goto :goto_5

    .line 47
    :cond_2
    :goto_2
    if-lez v2, :cond_5

    .line 48
    .line 49
    add-int/lit8 v2, v2, -0x1

    .line 50
    .line 51
    :goto_3
    if-ltz v2, :cond_5

    .line 52
    .line 53
    :try_start_2
    invoke-virtual {p1}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1, v2}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-direct {p0, v0}, LU3/a;->o(Landroidx/preference/Preference;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    const/4 v3, -0x1

    .line 66
    if-eq v3, v1, :cond_4

    .line 67
    .line 68
    invoke-virtual {v0}, Landroidx/preference/Preference;->P()Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-nez v4, :cond_3

    .line 73
    .line 74
    goto :goto_4

    .line 75
    :cond_3
    if-eq v3, v1, :cond_4

    .line 76
    .line 77
    invoke-virtual {v0}, Landroidx/preference/Preference;->P()Z

    .line 78
    .line 79
    .line 80
    move-result v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 81
    if-eqz v1, :cond_4

    .line 82
    .line 83
    return-object v0

    .line 84
    :cond_4
    :goto_4
    add-int/lit8 v2, v2, -0x1

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_5
    return-object v0

    .line 88
    :goto_5
    const-string p1, "XPG#Adapter"

    .line 89
    .line 90
    const-string v1, "get Pre Visible Preference error. e="

    .line 91
    .line 92
    invoke-static {p1, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 93
    .line 94
    .line 95
    return-object v0
.end method

.method private r(Landroidx/preference/Preference;)Z
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const-string v2, "_lastcategory"

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    return v1

    .line 21
    :cond_1
    invoke-virtual {p1}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    invoke-virtual {v2}, Landroidx/preference/PreferenceGroup;->a1()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    move v2, p0

    .line 33
    :goto_0
    move v3, p0

    .line 34
    :goto_1
    if-ge v3, v2, :cond_4

    .line 35
    .line 36
    invoke-virtual {p1}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v4, v3}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v4}, Landroidx/preference/Preference;->t()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    if-ne v4, v0, :cond_3

    .line 49
    .line 50
    move v0, v1

    .line 51
    goto :goto_2

    .line 52
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_4
    move v0, p0

    .line 56
    move v3, v0

    .line 57
    :goto_2
    sub-int/2addr v2, v1

    .line 58
    if-ne v3, v2, :cond_5

    .line 59
    .line 60
    return v1

    .line 61
    :cond_5
    if-eqz v0, :cond_6

    .line 62
    .line 63
    :try_start_0
    invoke-virtual {p1}, Landroidx/preference/Preference;->y()Landroidx/preference/PreferenceGroup;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    add-int/lit8 v0, v3, 0x1

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroidx/preference/PreferenceGroup;->Z0(I)Landroidx/preference/Preference;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .line 71
    .line 72
    goto :goto_3

    .line 73
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string p1, "index out of Bouunds. localPosition = "

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string p1, "XPG#Adapter"

    .line 91
    .line 92
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    return v1

    .line 96
    :cond_6
    :goto_3
    return p0
.end method

.method private s(Landroid/view/View;Landroid/view/View;Landroid/view/View;)Z
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    if-eqz p3, :cond_1

    .line 22
    .line 23
    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-ne v0, v1, :cond_1

    .line 28
    .line 29
    return p0

    .line 30
    :cond_1
    const/4 v0, 0x1

    .line 31
    if-eqz p2, :cond_2

    .line 32
    .line 33
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eq v2, v1, :cond_2

    .line 38
    .line 39
    if-eqz p3, :cond_2

    .line 40
    .line 41
    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eq v2, v1, :cond_2

    .line 46
    .line 47
    return v0

    .line 48
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Landroid/view/ViewGroup;

    .line 53
    .line 54
    instance-of v2, p1, Landroid/widget/RelativeLayout;

    .line 55
    .line 56
    if-nez v2, :cond_3

    .line 57
    .line 58
    return p0

    .line 59
    :cond_3
    if-eqz p3, :cond_4

    .line 60
    .line 61
    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    if-eq p3, v1, :cond_4

    .line 66
    .line 67
    move-object p3, p1

    .line 68
    check-cast p3, Landroid/widget/RelativeLayout;

    .line 69
    .line 70
    sget v2, LR3/g;->p0:I

    .line 71
    .line 72
    invoke-virtual {p3, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    check-cast p3, Landroid/widget/TextView;

    .line 77
    .line 78
    if-eqz p3, :cond_4

    .line 79
    .line 80
    return v0

    .line 81
    :cond_4
    if-eqz p2, :cond_5

    .line 82
    .line 83
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eq p2, v1, :cond_5

    .line 88
    .line 89
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 90
    .line 91
    const p2, 0x1020010

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Landroid/widget/TextView;

    .line 99
    .line 100
    if-eqz p1, :cond_5

    .line 101
    .line 102
    return v0

    .line 103
    :cond_5
    :goto_0
    return p0
.end method

.method private t(Landroid/view/View;I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 6
    .line 7
    if-eq p2, v0, :cond_0

    .line 8
    .line 9
    iput p2, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public k(Landroidx/preference/h;I)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-super {p0, p1, p2}, Landroidx/preference/c;->k(Landroidx/preference/h;I)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/view/View;->setId(I)V

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-direct {p0, p1, p2}, LU3/a;->n(Landroidx/preference/h;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    const-string p1, "XPG#Adapter"

    .line 21
    .line 22
    const-string p2, "custom error, e = "

    .line 23
    .line 24
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    check-cast p1, Landroidx/preference/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, LU3/a;->k(Landroidx/preference/h;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
