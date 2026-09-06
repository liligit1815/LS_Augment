.class Landroidx/appcompat/app/g$l;
.super Ljava/lang/Object;
.source "AppCompatDelegateImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/app/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "l"
.end annotation


# direct methods
.method static a(Landroid/content/res/Configuration;Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V
    .locals 3

    .line 1
    iget v0, p0, Landroid/content/res/Configuration;->colorMode:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x3

    .line 4
    .line 5
    iget v1, p1, Landroid/content/res/Configuration;->colorMode:I

    .line 6
    .line 7
    and-int/lit8 v2, v1, 0x3

    .line 8
    .line 9
    if-eq v0, v2, :cond_0

    .line 10
    .line 11
    iget v0, p2, Landroid/content/res/Configuration;->colorMode:I

    .line 12
    .line 13
    and-int/lit8 v1, v1, 0x3

    .line 14
    .line 15
    or-int/2addr v0, v1

    .line 16
    iput v0, p2, Landroid/content/res/Configuration;->colorMode:I

    .line 17
    .line 18
    :cond_0
    iget p0, p0, Landroid/content/res/Configuration;->colorMode:I

    .line 19
    .line 20
    and-int/lit8 p0, p0, 0xc

    .line 21
    .line 22
    iget p1, p1, Landroid/content/res/Configuration;->colorMode:I

    .line 23
    .line 24
    and-int/lit8 v0, p1, 0xc

    .line 25
    .line 26
    if-eq p0, v0, :cond_1

    .line 27
    .line 28
    iget p0, p2, Landroid/content/res/Configuration;->colorMode:I

    .line 29
    .line 30
    and-int/lit8 p1, p1, 0xc

    .line 31
    .line 32
    or-int/2addr p0, p1

    .line 33
    iput p0, p2, Landroid/content/res/Configuration;->colorMode:I

    .line 34
    .line 35
    :cond_1
    return-void
.end method
