.class Lcom/zte/mifavor/widget/PagerSecond$h$a;
.super Ljava/lang/Object;
.source "PagerSecond.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/PagerSecond$h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/zte/mifavor/widget/PagerSecond$h;",
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
.method public a(Landroid/os/Parcel;)Lcom/zte/mifavor/widget/PagerSecond$h;
    .locals 1

    .line 1
    new-instance p0, Lcom/zte/mifavor/widget/PagerSecond$h;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Lcom/zte/mifavor/widget/PagerSecond$h;-><init>(Landroid/os/Parcel;Lcom/zte/mifavor/widget/o;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public b(I)[Lcom/zte/mifavor/widget/PagerSecond$h;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/zte/mifavor/widget/PagerSecond$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/PagerSecond$h$a;->a(Landroid/os/Parcel;)Lcom/zte/mifavor/widget/PagerSecond$h;

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
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/PagerSecond$h$a;->b(I)[Lcom/zte/mifavor/widget/PagerSecond$h;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
