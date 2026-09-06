.class Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LayoutParamAction"
.end annotation


# static fields
.field static final LAYOUT_HEIGHT:I = 0x9

.field static final LAYOUT_MARGIN_BOTTOM:I = 0x3

.field static final LAYOUT_MARGIN_END:I = 0x5

.field static final LAYOUT_MARGIN_LEFT:I = 0x0

.field static final LAYOUT_MARGIN_RIGHT:I = 0x2

.field static final LAYOUT_MARGIN_START:I = 0x4

.field static final LAYOUT_MARGIN_TOP:I = 0x1

.field static final LAYOUT_WIDTH:I = 0x8


# instance fields
.field final mProperty:I

.field mValue:I

.field final mValueType:I


# direct methods
.method constructor <init>(IIFI)V
    .locals 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 3
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mProperty:I

    const/4 p1, 0x2

    .line 4
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValueType:I

    .line 5
    :try_start_0
    const-string p1, "android.util.TypedValue"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .line 6
    const-string p2, "createComplexDimension"

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v1, v2}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 7
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    filled-new-array {p2, p3}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const/4 p2, 0x0

    .line 8
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "LayoutParamAction error: "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "RemoteViews"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method constructor <init>(IIII)V
    .locals 1

    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 11
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 12
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mProperty:I

    .line 13
    iput p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValueType:I

    .line 14
    iput p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 16
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 17
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mProperty:I

    .line 18
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValueType:I

    .line 19
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    return-void
.end method

.method private getPixelOffset(Landroid/view/View;)I
    .locals 3

    .line 1
    :try_start_0
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValueType:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eq v0, v1, :cond_3

    .line 5
    .line 6
    const/4 v1, 0x3

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x4

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 21
    .line 22
    filled-new-array {p0}, [I

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 27
    .line 28
    .line 29
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 30
    :try_start_1
    invoke-virtual {p0, v2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    :try_start_2
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 35
    .line 36
    .line 37
    return p1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 40
    .line 41
    .line 42
    throw p1

    .line 43
    :cond_1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 44
    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    return v2

    .line 48
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0

    .line 59
    :cond_3
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p0, p1}, Landroid/util/TypedValue;->complexToDimensionPixelOffset(ILandroid/util/DisplayMetrics;)I

    .line 70
    .line 71
    .line 72
    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 73
    return p0

    .line 74
    :catchall_1
    move-exception p0

    .line 75
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 76
    .line 77
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    throw p1
.end method

.method private getPixelSize(Landroid/view/View;)I
    .locals 3

    .line 1
    :try_start_0
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValueType:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-eq v0, v1, :cond_3

    .line 5
    .line 6
    const/4 v1, 0x3

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v1, 0x4

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 14
    .line 15
    return p0

    .line 16
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 21
    .line 22
    filled-new-array {p0}, [I

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 27
    .line 28
    .line 29
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 30
    :try_start_1
    invoke-virtual {p0, v2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    :try_start_2
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 35
    .line 36
    .line 37
    return p1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 40
    .line 41
    .line 42
    throw p1

    .line 43
    :cond_1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 44
    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    return v2

    .line 48
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    return p0

    .line 59
    :cond_3
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p0, p1}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    .line 70
    .line 71
    .line 72
    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 73
    return p0

    .line 74
    :catchall_1
    move-exception p0

    .line 75
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 76
    .line 77
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    throw p1
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 1

    .line 1
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_1
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mProperty:I

    .line 20
    .line 21
    if-eqz p3, :cond_9

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    if-eq p3, v0, :cond_8

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    if-eq p3, v0, :cond_7

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    if-eq p3, v0, :cond_6

    .line 31
    .line 32
    const/4 v0, 0x4

    .line 33
    if-eq p3, v0, :cond_5

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    if-eq p3, v0, :cond_4

    .line 37
    .line 38
    const/16 v0, 0x8

    .line 39
    .line 40
    if-eq p3, v0, :cond_3

    .line 41
    .line 42
    const/16 v0, 0x9

    .line 43
    .line 44
    if-ne p3, v0, :cond_2

    .line 45
    .line 46
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->getPixelSize(Landroid/view/View;)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    iput p0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 57
    .line 58
    new-instance p2, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string p3, "Unknown property "

    .line 64
    .line 65
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mProperty:I

    .line 69
    .line 70
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw p1

    .line 81
    :cond_3
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->getPixelSize(Landroid/view/View;)I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    iput p0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 86
    .line 87
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_4
    instance-of p3, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 92
    .line 93
    if-eqz p3, :cond_a

    .line 94
    .line 95
    move-object p3, p2

    .line 96
    check-cast p3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 97
    .line 98
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->getPixelOffset(Landroid/view/View;)I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    invoke-virtual {p3, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_5
    instance-of p3, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 110
    .line 111
    if-eqz p3, :cond_a

    .line 112
    .line 113
    move-object p3, p2

    .line 114
    check-cast p3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 115
    .line 116
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->getPixelOffset(Landroid/view/View;)I

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    invoke-virtual {p3, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_6
    instance-of p3, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 128
    .line 129
    if-eqz p3, :cond_a

    .line 130
    .line 131
    move-object p3, p2

    .line 132
    check-cast p3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 133
    .line 134
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->getPixelOffset(Landroid/view/View;)I

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    iput p0, p3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_7
    instance-of p3, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 145
    .line 146
    if-eqz p3, :cond_a

    .line 147
    .line 148
    move-object p3, p2

    .line 149
    check-cast p3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 150
    .line 151
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->getPixelOffset(Landroid/view/View;)I

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    iput p0, p3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 156
    .line 157
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_8
    instance-of p3, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 162
    .line 163
    if-eqz p3, :cond_a

    .line 164
    .line 165
    move-object p3, p2

    .line 166
    check-cast p3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 167
    .line 168
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->getPixelOffset(Landroid/view/View;)I

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    iput p0, p3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 173
    .line 174
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_9
    instance-of p3, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 179
    .line 180
    if-eqz p3, :cond_a

    .line 181
    .line 182
    move-object p3, p2

    .line 183
    check-cast p3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 184
    .line 185
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->getPixelOffset(Landroid/view/View;)I

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    iput p0, p3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 190
    .line 191
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 192
    .line 193
    .line 194
    :cond_a
    :goto_0
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x13

    .line 2
    .line 3
    return p0
.end method

.method public getUniqueKey()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->getUniqueKey()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mProperty:I

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mProperty:I

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    .line 10
    .line 11
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValueType:I

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 14
    .line 15
    .line 16
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;->mValue:I

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
