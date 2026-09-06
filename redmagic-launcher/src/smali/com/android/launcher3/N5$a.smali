.class public Lcom/android/launcher3/N5$a;
.super Landroid/graphics/drawable/ColorDrawable;
.source "Utilities.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/N5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final a:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 3
    .line 4
    .line 5
    iput p1, p0, Lcom/android/launcher3/N5$a;->a:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getIntrinsicHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/N5$a;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public getIntrinsicWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/N5$a;->a:I

    .line 2
    .line 3
    return p0
.end method
