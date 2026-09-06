.class public final Lcom/android/launcher3/streamer/colorpicker/b$a;
.super Ljava/lang/Object;
.source "CheckerboardDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/streamer/colorpicker/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const v1, 0x7f070108

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/android/launcher3/streamer/colorpicker/b$a;->a:I

    .line 16
    .line 17
    const v0, 0x7f060056

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Lcom/android/launcher3/streamer/colorpicker/b$a;->b:I

    .line 25
    .line 26
    const v0, 0x7f060055

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/b$a;->c:I

    .line 34
    .line 35
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/streamer/colorpicker/b$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/streamer/colorpicker/b$a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/streamer/colorpicker/b$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/streamer/colorpicker/b$a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/streamer/colorpicker/b$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/streamer/colorpicker/b$a;->a:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public d()Lcom/android/launcher3/streamer/colorpicker/b;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/streamer/colorpicker/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/streamer/colorpicker/b;-><init>(Lcom/android/launcher3/streamer/colorpicker/b$a;LT1/b;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
