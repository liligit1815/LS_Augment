.class Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TextViewDrawableAction"
.end annotation


# instance fields
.field mD1:I

.field mD2:I

.field mD3:I

.field mD4:I

.field mDrawablesLoaded:Z

.field mI1:Landroid/graphics/drawable/Icon;

.field mI2:Landroid/graphics/drawable/Icon;

.field mI3:Landroid/graphics/drawable/Icon;

.field mI4:Landroid/graphics/drawable/Icon;

.field mId1:Landroid/graphics/drawable/Drawable;

.field mId2:Landroid/graphics/drawable/Drawable;

.field mId3:Landroid/graphics/drawable/Drawable;

.field mId4:Landroid/graphics/drawable/Drawable;

.field mIsRelative:Z

.field mUseIcons:Z


# direct methods
.method public constructor <init>(IZIIII)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mDrawablesLoaded:Z

    .line 3
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 4
    iput-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mIsRelative:Z

    .line 5
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    .line 6
    iput p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD1:I

    .line 7
    iput p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD2:I

    .line 8
    iput p5, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD3:I

    .line 9
    iput p6, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD4:I

    return-void
.end method

.method public constructor <init>(IZLandroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;)V
    .locals 1

    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mDrawablesLoaded:Z

    .line 12
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 13
    iput-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mIsRelative:Z

    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    .line 15
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI1:Landroid/graphics/drawable/Icon;

    .line 16
    iput-object p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI2:Landroid/graphics/drawable/Icon;

    .line 17
    iput-object p5, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI3:Landroid/graphics/drawable/Icon;

    .line 18
    iput-object p6, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI4:Landroid/graphics/drawable/Icon;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mIsRelative:Z

    .line 21
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    .line 22
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mDrawablesLoaded:Z

    .line 23
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 24
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mIsRelative:Z

    .line 25
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_1

    move v0, v2

    :cond_1
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    if-eqz v0, :cond_2

    .line 26
    sget-object v0, Landroid/graphics/drawable/Icon;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Icon;

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI1:Landroid/graphics/drawable/Icon;

    .line 27
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Icon;

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI2:Landroid/graphics/drawable/Icon;

    .line 28
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Icon;

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI3:Landroid/graphics/drawable/Icon;

    .line 29
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/Icon;

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI4:Landroid/graphics/drawable/Icon;

    return-void

    .line 30
    :cond_2
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD1:I

    .line 31
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD2:I

    .line 32
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD3:I

    .line 33
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD4:I

    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 4

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
    check-cast p1, Landroid/widget/TextView;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mDrawablesLoaded:Z

    .line 13
    .line 14
    if-eqz p2, :cond_2

    .line 15
    .line 16
    iget-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mIsRelative:Z

    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId1:Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId2:Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId3:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId4:Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    invoke-virtual {p1, p2, p3, v0, p0}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId1:Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId2:Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId3:Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId4:Landroid/graphics/drawable/Drawable;

    .line 39
    .line 40
    invoke-virtual {p1, p2, p3, v0, p0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    iget-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    .line 45
    .line 46
    if-eqz p2, :cond_8

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI1:Landroid/graphics/drawable/Icon;

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    if-nez p3, :cond_3

    .line 56
    .line 57
    move-object p3, v0

    .line 58
    goto :goto_0

    .line 59
    :cond_3
    invoke-virtual {p3, p2}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    :goto_0
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI2:Landroid/graphics/drawable/Icon;

    .line 64
    .line 65
    if-nez v1, :cond_4

    .line 66
    .line 67
    move-object v1, v0

    .line 68
    goto :goto_1

    .line 69
    :cond_4
    invoke-virtual {v1, p2}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    :goto_1
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI3:Landroid/graphics/drawable/Icon;

    .line 74
    .line 75
    if-nez v2, :cond_5

    .line 76
    .line 77
    move-object v2, v0

    .line 78
    goto :goto_2

    .line 79
    :cond_5
    invoke-virtual {v2, p2}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    :goto_2
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI4:Landroid/graphics/drawable/Icon;

    .line 84
    .line 85
    if-nez v3, :cond_6

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_6
    invoke-virtual {v3, p2}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    :goto_3
    iget-boolean p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mIsRelative:Z

    .line 93
    .line 94
    if-eqz p0, :cond_7

    .line 95
    .line 96
    invoke-virtual {p1, p3, v1, v2, v0}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_7
    invoke-virtual {p1, p3, v1, v2, v0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_8
    iget-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mIsRelative:Z

    .line 105
    .line 106
    if-eqz p2, :cond_9

    .line 107
    .line 108
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD1:I

    .line 109
    .line 110
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD2:I

    .line 111
    .line 112
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD3:I

    .line 113
    .line 114
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD4:I

    .line 115
    .line 116
    invoke-virtual {p1, p2, p3, v0, p0}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_9
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD1:I

    .line 121
    .line 122
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD2:I

    .line 123
    .line 124
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD3:I

    .line 125
    .line 126
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD4:I

    .line 127
    .line 128
    invoke-virtual {p1, p2, p3, v0, p0}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0xb

    .line 2
    .line 3
    return p0
.end method

.method public initActionAsync(Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Lcom/zte/toolsdk/widget/RemoteViews$Action;
    .locals 8

    .line 1
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/widget/TextView;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/zte/toolsdk/widget/RemoteViews;->L()Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;

    .line 21
    .line 22
    iget v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 23
    .line 24
    iget-boolean v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mIsRelative:Z

    .line 25
    .line 26
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI1:Landroid/graphics/drawable/Icon;

    .line 27
    .line 28
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI2:Landroid/graphics/drawable/Icon;

    .line 29
    .line 30
    iget-object v5, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI3:Landroid/graphics/drawable/Icon;

    .line 31
    .line 32
    iget-object v6, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI4:Landroid/graphics/drawable/Icon;

    .line 33
    .line 34
    invoke-direct/range {v0 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;-><init>(IZLandroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;

    .line 39
    .line 40
    iget v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 41
    .line 42
    iget-boolean v3, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mIsRelative:Z

    .line 43
    .line 44
    iget v4, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD1:I

    .line 45
    .line 46
    iget v5, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD2:I

    .line 47
    .line 48
    iget v6, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD3:I

    .line 49
    .line 50
    iget v7, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD4:I

    .line 51
    .line 52
    invoke-direct/range {v1 .. v7}, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;-><init>(IZIIII)V

    .line 53
    .line 54
    .line 55
    move-object v0, v1

    .line 56
    :goto_0
    const/4 p2, 0x1

    .line 57
    iput-boolean p2, v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mDrawablesLoaded:Z

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    .line 64
    .line 65
    const/4 p3, 0x0

    .line 66
    if-eqz p2, :cond_6

    .line 67
    .line 68
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI1:Landroid/graphics/drawable/Icon;

    .line 69
    .line 70
    if-nez p2, :cond_2

    .line 71
    .line 72
    move-object p2, p3

    .line 73
    goto :goto_1

    .line 74
    :cond_2
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    :goto_1
    iput-object p2, v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId1:Landroid/graphics/drawable/Drawable;

    .line 79
    .line 80
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI2:Landroid/graphics/drawable/Icon;

    .line 81
    .line 82
    if-nez p2, :cond_3

    .line 83
    .line 84
    move-object p2, p3

    .line 85
    goto :goto_2

    .line 86
    :cond_3
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    :goto_2
    iput-object p2, v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId2:Landroid/graphics/drawable/Drawable;

    .line 91
    .line 92
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI3:Landroid/graphics/drawable/Icon;

    .line 93
    .line 94
    if-nez p2, :cond_4

    .line 95
    .line 96
    move-object p2, p3

    .line 97
    goto :goto_3

    .line 98
    :cond_4
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    :goto_3
    iput-object p2, v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId3:Landroid/graphics/drawable/Drawable;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI4:Landroid/graphics/drawable/Icon;

    .line 105
    .line 106
    if-nez p0, :cond_5

    .line 107
    .line 108
    goto :goto_4

    .line 109
    :cond_5
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    .line 110
    .line 111
    .line 112
    move-result-object p3

    .line 113
    :goto_4
    iput-object p3, v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId4:Landroid/graphics/drawable/Drawable;

    .line 114
    .line 115
    return-object v0

    .line 116
    :cond_6
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD1:I

    .line 117
    .line 118
    if-nez p2, :cond_7

    .line 119
    .line 120
    move-object p2, p3

    .line 121
    goto :goto_5

    .line 122
    :cond_7
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    :goto_5
    iput-object p2, v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId1:Landroid/graphics/drawable/Drawable;

    .line 127
    .line 128
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD2:I

    .line 129
    .line 130
    if-nez p2, :cond_8

    .line 131
    .line 132
    move-object p2, p3

    .line 133
    goto :goto_6

    .line 134
    :cond_8
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    :goto_6
    iput-object p2, v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId2:Landroid/graphics/drawable/Drawable;

    .line 139
    .line 140
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD3:I

    .line 141
    .line 142
    if-nez p2, :cond_9

    .line 143
    .line 144
    move-object p2, p3

    .line 145
    goto :goto_7

    .line 146
    :cond_9
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    :goto_7
    iput-object p2, v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId3:Landroid/graphics/drawable/Drawable;

    .line 151
    .line 152
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD4:I

    .line 153
    .line 154
    if-nez p0, :cond_a

    .line 155
    .line 156
    goto :goto_8

    .line 157
    :cond_a
    invoke-virtual {p1, p0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 158
    .line 159
    .line 160
    move-result-object p3

    .line 161
    :goto_8
    iput-object p3, v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mId4:Landroid/graphics/drawable/Drawable;

    .line 162
    .line 163
    return-object v0
.end method

.method public prefersAsyncApply()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    .line 2
    .line 3
    return p0
.end method

.method public visitUris(Ljava/util/function/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI1:Landroid/graphics/drawable/Icon;

    .line 6
    .line 7
    invoke-static {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->W(Landroid/graphics/drawable/Icon;Ljava/util/function/Consumer;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI2:Landroid/graphics/drawable/Icon;

    .line 11
    .line 12
    invoke-static {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->W(Landroid/graphics/drawable/Icon;Ljava/util/function/Consumer;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI3:Landroid/graphics/drawable/Icon;

    .line 16
    .line 17
    invoke-static {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->W(Landroid/graphics/drawable/Icon;Ljava/util/function/Consumer;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI4:Landroid/graphics/drawable/Icon;

    .line 21
    .line 22
    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->W(Landroid/graphics/drawable/Icon;Ljava/util/function/Consumer;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mIsRelative:Z

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    .line 10
    .line 11
    iget-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 14
    .line 15
    .line 16
    iget-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mUseIcons:Z

    .line 17
    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI1:Landroid/graphics/drawable/Icon;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI2:Landroid/graphics/drawable/Icon;

    .line 27
    .line 28
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI3:Landroid/graphics/drawable/Icon;

    .line 32
    .line 33
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mI4:Landroid/graphics/drawable/Icon;

    .line 37
    .line 38
    invoke-virtual {p1, p0, v0}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD1:I

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 45
    .line 46
    .line 47
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD2:I

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 50
    .line 51
    .line 52
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD3:I

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 55
    .line 56
    .line 57
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;->mD4:I

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
