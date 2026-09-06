.class public Lcom/android/launcher3/b0$e;
.super Ljava/lang/Object;
.source "DesktopGrid.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/b0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:F


# direct methods
.method constructor <init>(FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lcom/android/launcher3/b0$e;->b:F

    .line 3
    iput p2, p0, Lcom/android/launcher3/b0$e;->d:F

    .line 4
    iput p1, p0, Lcom/android/launcher3/b0$e;->a:F

    .line 5
    iput p1, p0, Lcom/android/launcher3/b0$e;->c:F

    return-void
.end method

.method constructor <init>(FFFF)V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iput p1, p0, Lcom/android/launcher3/b0$e;->b:F

    .line 8
    iput p2, p0, Lcom/android/launcher3/b0$e;->d:F

    .line 9
    iput p3, p0, Lcom/android/launcher3/b0$e;->a:F

    .line 10
    iput p4, p0, Lcom/android/launcher3/b0$e;->c:F

    return-void
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/b0$e;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public b()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/b0$e;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public c()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/b0$e;->a:F

    .line 2
    .line 3
    return p0
.end method
