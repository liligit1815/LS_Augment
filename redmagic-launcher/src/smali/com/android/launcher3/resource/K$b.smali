.class public Lcom/android/launcher3/resource/K$b;
.super Ljava/lang/Object;
.source "MenuResource.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/resource/K;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
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
    .locals 2

    .line 1
    check-cast p1, Lcom/android/launcher3/resource/K$e;

    .line 2
    .line 3
    check-cast p2, Lcom/android/launcher3/resource/K$e;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sub-int/2addr p0, v0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/android/launcher3/resource/K$e;->n()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$e;->n()J

    .line 21
    .line 22
    .line 23
    move-result-wide p0

    .line 24
    sub-long/2addr v0, p0

    .line 25
    long-to-int p0, v0

    .line 26
    return p0

    .line 27
    :cond_0
    invoke-virtual {p2}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/resource/K$e;->r()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    sub-int/2addr p0, p1

    .line 36
    return p0
.end method
