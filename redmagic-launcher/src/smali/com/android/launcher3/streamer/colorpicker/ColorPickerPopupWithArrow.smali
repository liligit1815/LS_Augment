.class public Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;
.super Lcom/android/launcher3/popup/c;
.source "ColorPickerPopupWithArrow.java"

# interfaces
.implements LT1/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/android/launcher3/statemanager/h<",
        "Lcom/android/launcher3/V3;",
        ">;>",
        "Lcom/android/launcher3/popup/c<",
        "TT;>;",
        "LT1/c;"
    }
.end annotation


# static fields
.field private static final q:Ljava/lang/String; = "ColorPickerPopupWithArrow"


# instance fields
.field private g:Landroid/view/View;

.field private h:Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;

.field private i:Lcom/android/launcher3/streamer/colorpicker/HueSliderView;

.field private j:Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;

.field private k:I

.field private l:[I

.field m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LT1/d;",
            ">;"
        }
    .end annotation
.end field

.field private n:LT1/c;

.field private o:Z

.field final p:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/popup/c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p1, -0x7fbfc0

    .line 2
    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->k:I

    const/4 p1, 0x5

    .line 3
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->l:[I

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->m:Ljava/util/List;

    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 6
    new-instance p1, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow$a;

    invoke-direct {p1, p0}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow$a;-><init>(Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;)V

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0709e4

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->p:I

    return-void
.end method

.method public static synthetic Q(Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;IILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->W(IILandroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static synthetic R(Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/popup/c;->mOutlineRadius:F

    .line 2
    .line 3
    return p0
.end method

.method private static S(Lcom/android/launcher3/v;)Lcom/android/launcher3/popup/PopupContainerWithArrow;
    .locals 1

    .line 1
    const/high16 v0, 0x8000000

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 8
    .line 9
    return-object p0
.end method

.method private U()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->V()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b00c3

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->h:Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;

    .line 14
    .line 15
    const v0, 0x7f0b02fa

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/android/launcher3/streamer/colorpicker/HueSliderView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->i:Lcom/android/launcher3/streamer/colorpicker/HueSliderView;

    .line 25
    .line 26
    const v0, 0x7f0b0176

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->j:Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->i:Lcom/android/launcher3/streamer/colorpicker/HueSliderView;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->d(LT1/c;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->h:Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->j:Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/android/launcher3/streamer/colorpicker/a;->d(LT1/c;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->Y()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method private V()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->y()[I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->l:[I

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->l:[I

    .line 25
    .line 26
    array-length v2, v1

    .line 27
    const/4 v3, 0x0

    .line 28
    move v4, v3

    .line 29
    :goto_0
    if-ge v4, v2, :cond_0

    .line 30
    .line 31
    aget v5, v1, v4

    .line 32
    .line 33
    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v5, ","

    .line 41
    .line 42
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    add-int/lit8 v4, v4, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    sget-object v1, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->q:Ljava/lang/String;

    .line 49
    .line 50
    new-instance v2, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v4, "initRecentColors: "

    .line 56
    .line 57
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    const v0, 0x7f0b0174

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Landroid/widget/LinearLayout;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    const/4 v2, 0x1

    .line 84
    :goto_1
    if-ge v2, v1, :cond_3

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    check-cast v4, Landroid/widget/ImageView;

    .line 91
    .line 92
    add-int/lit8 v5, v1, -0x2

    .line 93
    .line 94
    if-ne v2, v5, :cond_1

    .line 95
    .line 96
    iget-object v5, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 97
    .line 98
    const-string v6, "color_picker_recent_color_divider_line"

    .line 99
    .line 100
    invoke-static {v5, v6}, Lf1/d;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_1
    iget-object v5, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->l:[I

    .line 113
    .line 114
    aget v5, v5, v3

    .line 115
    .line 116
    add-int/lit8 v6, v3, 0x1

    .line 117
    .line 118
    iget-object v7, p0, Lcom/android/launcher3/popup/c;->mActivityContext:Landroid/content/Context;

    .line 119
    .line 120
    const-string v8, "color_picker_recent_button"

    .line 121
    .line 122
    invoke-static {v7, v8}, Lf1/d;->d(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 123
    .line 124
    .line 125
    move-result-object v7

    .line 126
    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 127
    .line 128
    .line 129
    move-result-object v7

    .line 130
    instance-of v8, v7, Landroid/graphics/drawable/GradientDrawable;

    .line 131
    .line 132
    if-eqz v8, :cond_2

    .line 133
    .line 134
    move-object v8, v7

    .line 135
    check-cast v8, Landroid/graphics/drawable/GradientDrawable;

    .line 136
    .line 137
    invoke-virtual {v8, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 138
    .line 139
    .line 140
    :cond_2
    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 141
    .line 142
    .line 143
    new-instance v7, LT1/e;

    .line 144
    .line 145
    invoke-direct {v7, p0, v5, v3}, LT1/e;-><init>(Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;II)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    .line 150
    .line 151
    move v3, v6

    .line 152
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_3
    return-void
.end method

.method private synthetic W(IILandroid/view/View;)V
    .locals 0

    .line 1
    const/4 p3, 0x4

    .line 2
    if-ne p2, p3, :cond_0

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-static {p2}, Lx1/O;->z1(Landroid/content/Context;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 15
    .line 16
    instance-of p3, p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 17
    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    check-cast p2, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {p2}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    if-eqz p3, :cond_0

    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iget-object p2, p2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 43
    .line 44
    iget-boolean p2, p2, Lcom/android/launcher3/r4;->s0:Z

    .line 45
    .line 46
    if-eqz p2, :cond_0

    .line 47
    .line 48
    const p1, -0x7fd3d3d4

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->setBaseColor(I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static X(Landroid/view/View;ILT1/d;)Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->S(Lcom/android/launcher3/v;)Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v2, 0x0

    .line 29
    const v3, 0x7f0e0085

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v3, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->T(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p2}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->C(LT1/d;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->setBaseColor(I)V

    .line 45
    .line 46
    .line 47
    invoke-direct {v0}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->Z()V

    .line 48
    .line 49
    .line 50
    return-object v0
.end method

.method private Y()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->m:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, LT1/d;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 24
    .line 25
    invoke-interface {v2, v1}, LT1/c;->k(LT1/d;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->h:Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, v1}, Lcom/android/launcher3/streamer/colorpicker/a;->setOnlyUpdateOnTouchEventUp(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->i:Lcom/android/launcher3/streamer/colorpicker/HueSliderView;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/android/launcher3/streamer/colorpicker/a;->setOnlyUpdateOnTouchEventUp(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->j:Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->setOnlyUpdateOnTouchEventUp(Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->h:Lcom/android/launcher3/streamer/colorpicker/AlphaSliderView;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iput-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 50
    .line 51
    iget-boolean v2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->o:Z

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Lcom/android/launcher3/streamer/colorpicker/a;->setOnlyUpdateOnTouchEventUp(Z)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->j:Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 60
    .line 61
    iget-boolean v2, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->o:Z

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Lcom/android/launcher3/streamer/colorpicker/ColorRoundRectView;->setOnlyUpdateOnTouchEventUp(Z)V

    .line 64
    .line 65
    .line 66
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->m:Ljava/util/List;

    .line 67
    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_2

    .line 79
    .line 80
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, LT1/d;

    .line 85
    .line 86
    iget-object v3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 87
    .line 88
    invoke-interface {v3, v2}, LT1/c;->C(LT1/d;)V

    .line 89
    .line 90
    .line 91
    iget-object v3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 92
    .line 93
    invoke-interface {v3}, LT1/c;->getColor()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    const/4 v4, 0x1

    .line 98
    invoke-interface {v2, v3, v1, v4}, LT1/d;->a(IZZ)V

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_2
    return-void
.end method

.method private Z()V
    .locals 5

    .line 1
    const v0, 0x7f0b0175

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p0}, Landroid/widget/TextView;->getMeasuredWidth()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    int-to-float v2, v2

    .line 38
    cmpl-float v3, v1, v2

    .line 39
    .line 40
    if-lez v3, :cond_1

    .line 41
    .line 42
    div-float/2addr v2, v1

    .line 43
    new-instance v1, Landroid/text/SpannableString;

    .line 44
    .line 45
    invoke-direct {v1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    new-instance v3, Landroid/text/style/RelativeSizeSpan;

    .line 49
    .line 50
    invoke-direct {v3, v2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/16 v2, 0x12

    .line 58
    .line 59
    const/4 v4, 0x0

    .line 60
    invoke-virtual {v1, v3, v4, v0, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public C(LT1/d;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 2
    .line 3
    invoke-interface {v0, p1}, LT1/c;->C(LT1/d;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->m:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public T(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->U()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->show()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected closeComplete()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/popup/c;->closeComplete()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->k:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 7
    .line 8
    invoke-interface {v1}, LT1/c;->getColor()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 27
    .line 28
    invoke-interface {v1}, LT1/c;->getColor()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/android/launcher3/H5;->c(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 36
    .line 37
    instance-of v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 54
    .line 55
    check-cast p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Lz1/J3;->a0(Lcom/android/launcher3/model/data/p;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public getColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 2
    .line 3
    invoke-interface {p0}, LT1/c;->getColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method protected getTargetObjectLocation(Landroid/graphics/Rect;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 8
    .line 9
    .line 10
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    add-int/2addr v0, v1

    .line 19
    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    add-int/2addr v0, v1

    .line 30
    iput v0, p1, Landroid/graphics/Rect;->left:I

    .line 31
    .line 32
    iget v0, p1, Landroid/graphics/Rect;->right:I

    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    sub-int/2addr v0, v1

    .line 41
    iput v0, p1, Landroid/graphics/Rect;->right:I

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 44
    .line 45
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 50
    .line 51
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 60
    .line 61
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    goto :goto_0

    .line 76
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    :goto_0
    add-int/2addr v1, p0

    .line 83
    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 84
    .line 85
    return-void

    .line 86
    :cond_1
    instance-of v1, v0, Lcom/android/launcher3/folder/FolderIcon;

    .line 87
    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    instance-of v1, v0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 91
    .line 92
    if-eqz v1, :cond_2

    .line 93
    .line 94
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    sub-int/2addr p0, v0

    .line 101
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 102
    .line 103
    return-void

    .line 104
    :cond_2
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr v1, v0

    .line 111
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->g:Landroid/view/View;

    .line 112
    .line 113
    check-cast p0, Lcom/android/launcher3/folder/FolderIcon;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getFolderName()Lcom/android/launcher3/BubbleTextView;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0}, Landroid/widget/TextView;->getHeight()I

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    sub-int/2addr v1, p0

    .line 124
    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 125
    .line 126
    return-void

    .line 127
    :cond_3
    instance-of p0, v0, Landroid/appwidget/AppWidgetHostView;

    .line 128
    .line 129
    if-eqz p0, :cond_4

    .line 130
    .line 131
    iget p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    sub-int/2addr p0, v0

    .line 138
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 139
    .line 140
    :cond_4
    return-void
.end method

.method protected isOfType(I)Z
    .locals 0

    .line 1
    const/high16 p0, 0x8000000

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public k(LT1/d;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->n:LT1/c;

    .line 2
    .line 3
    invoke-interface {v0, p1}, LT1/c;->k(LT1/d;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->m:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/popup/c;->getPopupContainer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 22
    .line 23
    .line 24
    return p1
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Lcom/android/launcher3/popup/c;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->k:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->setBaseColor(I)V

    .line 7
    .line 8
    .line 9
    iget p1, p0, Lcom/android/launcher3/popup/c;->mGravity:I

    .line 10
    .line 11
    invoke-static {p1}, Landroid/view/Gravity;->isHorizontal(I)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget p1, p0, Lcom/android/launcher3/popup/c;->mGravity:I

    .line 18
    .line 19
    invoke-static {p1}, Landroid/view/Gravity;->isVertical(I)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getX()F

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object p2, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 30
    .line 31
    iget p2, p2, Landroid/graphics/Rect;->left:I

    .line 32
    .line 33
    int-to-float p2, p2

    .line 34
    cmpg-float p1, p1, p2

    .line 35
    .line 36
    if-gtz p1, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getX()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    int-to-float p2, p4

    .line 43
    add-float/2addr p1, p2

    .line 44
    iget-object p2, p0, Lcom/android/launcher3/popup/c;->mTempRect:Landroid/graphics/Rect;

    .line 45
    .line 46
    iget p3, p2, Landroid/graphics/Rect;->right:I

    .line 47
    .line 48
    int-to-float p3, p3

    .line 49
    cmpl-float p1, p1, p3

    .line 50
    .line 51
    if-ltz p1, :cond_0

    .line 52
    .line 53
    iget-object p1, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 54
    .line 55
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    iget p3, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->p:I

    .line 60
    .line 61
    sub-int/2addr p2, p3

    .line 62
    int-to-float p2, p2

    .line 63
    invoke-virtual {p1, p2}, Landroid/view/View;->setX(F)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/launcher3/popup/c;->mArrow:Landroid/view/View;

    .line 67
    .line 68
    const/4 p1, 0x0

    .line 69
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method

.method public setBaseColor(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->k:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->i:Lcom/android/launcher3/streamer/colorpicker/HueSliderView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/streamer/colorpicker/a;->h(IZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setOnlyUpdateOnTouchEventUp(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->o:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->Y()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
