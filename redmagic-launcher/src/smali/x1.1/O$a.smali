.class public Lx1/O$a;
.super Ljava/lang/Object;
.source "MFVUtils.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lx1/O;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .line 1
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    iget p0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 6
    .line 7
    iget v0, p1, Lcom/android/launcher3/model/data/y;->container:I

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    iget p0, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 12
    .line 13
    iget p1, p1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 14
    .line 15
    sub-int/2addr p0, p1

    .line 16
    return p0

    .line 17
    :cond_0
    sub-int/2addr p0, v0

    .line 18
    return p0
.end method
