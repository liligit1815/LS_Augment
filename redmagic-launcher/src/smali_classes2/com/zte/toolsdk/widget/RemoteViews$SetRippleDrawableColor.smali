.class Lcom/zte/toolsdk/widget/RemoteViews$SetRippleDrawableColor;
.super Lcom/zte/toolsdk/widget/RemoteViews$Action;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetRippleDrawableColor"
.end annotation


# instance fields
.field mColorStateList:Landroid/content/res/ColorStateList;


# direct methods
.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/content/res/ColorStateList;)V
    .locals 0

    const/4 p1, 0x0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 2
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 3
    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRippleDrawableColor;->mColorStateList:Landroid/content/res/ColorStateList;

    return-void
.end method

.method constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V
    .locals 1

    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;-><init>(Lcom/zte/toolsdk/widget/z;)V

    .line 5
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 6
    const-class v0, Landroid/content/res/ColorStateList;

    invoke-virtual {p2, p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/res/ColorStateList;

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRippleDrawableColor;->mColorStateList:Landroid/content/res/ColorStateList;

    return-void
.end method


# virtual methods
.method public apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

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
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    instance-of p2, p1, Landroid/graphics/drawable/RippleDrawable;

    .line 15
    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Landroid/graphics/drawable/RippleDrawable;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRippleDrawableColor;->mColorStateList:Landroid/content/res/ColorStateList;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/RippleDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x15

    .line 2
    .line 3
    return p0
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
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRippleDrawableColor;->mColorStateList:Landroid/content/res/ColorStateList;

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p1, p0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
