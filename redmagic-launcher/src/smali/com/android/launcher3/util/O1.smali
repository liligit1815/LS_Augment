.class public Lcom/android/launcher3/util/O1;
.super Lcom/android/launcher3/model/data/y;
.source "PendingRequestArgs.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/launcher3/util/O1;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:I

.field private final h:I

.field private final i:I

.field private final j:Landroid/os/Parcelable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/O1$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/O1$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/util/O1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(IIILandroid/os/Parcelable;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Lcom/android/launcher3/model/data/y;-><init>()V

    .line 3
    iput p1, p0, Lcom/android/launcher3/util/O1;->g:I

    .line 4
    iput p2, p0, Lcom/android/launcher3/util/O1;->h:I

    .line 5
    iput p3, p0, Lcom/android/launcher3/util/O1;->i:I

    .line 6
    iput-object p4, p0, Lcom/android/launcher3/util/O1;->j:Landroid/os/Parcelable;

    return-void
.end method

.method public constructor <init>(IILandroid/os/Parcelable;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/android/launcher3/util/O1;-><init>(IIILandroid/os/Parcelable;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/model/data/y;-><init>()V

    .line 8
    sget-object v0, Landroid/content/ContentValues;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentValues;

    invoke-virtual {p0, v0}, Lcom/android/launcher3/model/data/y;->readFromValues(Landroid/content/ContentValues;)V

    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/UserHandle;

    iput-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 10
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/util/O1;->g:I

    .line 11
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/util/O1;->h:I

    .line 12
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/util/O1;->i:I

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/util/O1;->j:Landroid/os/Parcelable;

    return-void
.end method

.method public static v(ILandroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/O1;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/O1;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, p0, v1, p1}, Lcom/android/launcher3/util/O1;-><init>(IILandroid/os/Parcelable;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0, p2}, Lcom/android/launcher3/model/data/y;->copyFrom(Lcom/android/launcher3/model/data/y;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static w(ILcom/android/launcher3/widget/N0;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/O1;
    .locals 3

    .line 1
    instance-of v0, p2, Lcom/android/launcher3/widget/z0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/android/launcher3/widget/z0;

    .line 7
    .line 8
    iget v0, v0, Lcom/android/launcher3/widget/z0;->q:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, -0x1

    .line 12
    :goto_0
    new-instance v1, Lcom/android/launcher3/util/O1;

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    invoke-direct {v1, p0, v0, v2, p1}, Lcom/android/launcher3/util/O1;-><init>(IIILandroid/os/Parcelable;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Lcom/android/launcher3/model/data/y;->copyFrom(Lcom/android/launcher3/model/data/y;)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method


# virtual methods
.method public A()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/O1;->i:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget p0, p0, Lcom/android/launcher3/util/O1;->g:I

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public B()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/O1;->i:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget p0, p0, Lcom/android/launcher3/util/O1;->h:I

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, -0x1

    .line 10
    return p0
.end method

.method public describeContents()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/ContentValues;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/util/G;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v1, v0, v2}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/ContentValues;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/android/launcher3/model/data/y;->writeToValues(Lcom/android/launcher3/util/G;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->writeToParcel(Landroid/os/Parcel;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 19
    .line 20
    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lcom/android/launcher3/util/O1;->g:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/android/launcher3/util/O1;->h:I

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 31
    .line 32
    .line 33
    iget v0, p0, Lcom/android/launcher3/util/O1;->i:I

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/util/O1;->j:Landroid/os/Parcelable;

    .line 39
    .line 40
    invoke-virtual {p1, p0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 41
    .line 42
    .line 43
    :try_start_0
    invoke-virtual {v1}, Lcom/android/launcher3/util/G;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    move-exception p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public x()Landroid/content/Intent;
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/O1;->i:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/O1;->j:Landroid/os/Parcelable;

    .line 7
    .line 8
    check-cast p0, Landroid/content/Intent;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public y()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/O1;->i:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget p0, p0, Lcom/android/launcher3/util/O1;->g:I

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public z()Lcom/android/launcher3/widget/N0;
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/util/O1;->i:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/O1;->j:Landroid/os/Parcelable;

    .line 7
    .line 8
    check-cast p0, Lcom/android/launcher3/widget/N0;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method
