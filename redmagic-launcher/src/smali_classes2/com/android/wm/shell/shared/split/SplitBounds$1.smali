.class Lcom/android/wm/shell/shared/split/SplitBounds$1;
.super Ljava/lang/Object;
.source "SplitBounds.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wm/shell/shared/split/SplitBounds;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/android/wm/shell/shared/split/SplitBounds;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/android/wm/shell/shared/split/SplitBounds;
    .locals 0

    .line 2
    new-instance p0, Lcom/android/wm/shell/shared/split/SplitBounds;

    invoke-direct {p0, p1}, Lcom/android/wm/shell/shared/split/SplitBounds;-><init>(Landroid/os/Parcel;)V

    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wm/shell/shared/split/SplitBounds$1;->createFromParcel(Landroid/os/Parcel;)Lcom/android/wm/shell/shared/split/SplitBounds;

    move-result-object p0

    return-object p0
.end method

.method public newArray(I)[Lcom/android/wm/shell/shared/split/SplitBounds;
    .locals 0

    .line 2
    new-array p0, p1, [Lcom/android/wm/shell/shared/split/SplitBounds;

    return-object p0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wm/shell/shared/split/SplitBounds$1;->newArray(I)[Lcom/android/wm/shell/shared/split/SplitBounds;

    move-result-object p0

    return-object p0
.end method
