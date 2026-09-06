.class Lcom/google/android/material/datepicker/f$a;
.super Ljava/lang/Object;
.source "DateValidatorPointForward.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/datepicker/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/google/android/material/datepicker/f;",
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
.method public a(Landroid/os/Parcel;)Lcom/google/android/material/datepicker/f;
    .locals 2

    .line 1
    new-instance p0, Lcom/google/android/material/datepicker/f;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-direct {p0, v0, v1, p1}, Lcom/google/android/material/datepicker/f;-><init>(JLcom/google/android/material/datepicker/f$a;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public b(I)[Lcom/google/android/material/datepicker/f;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/google/android/material/datepicker/f;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/f$a;->a(Landroid/os/Parcel;)Lcom/google/android/material/datepicker/f;

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
    invoke-virtual {p0, p1}, Lcom/google/android/material/datepicker/f$a;->b(I)[Lcom/google/android/material/datepicker/f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
