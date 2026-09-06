.class Lcom/android/wm/shell/shared/i$a;
.super Ljava/lang/Object;
.source "GroupedTaskInfo.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wm/shell/shared/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
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
.method public a(Landroid/os/Parcel;)Lcom/android/wm/shell/shared/i;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/wm/shell/shared/i;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/wm/shell/shared/i;-><init>(Landroid/os/Parcel;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b(I)[Lcom/android/wm/shell/shared/i;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/android/wm/shell/shared/i;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wm/shell/shared/i$a;->a(Landroid/os/Parcel;)Lcom/android/wm/shell/shared/i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wm/shell/shared/i$a;->b(I)[Lcom/android/wm/shell/shared/i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
