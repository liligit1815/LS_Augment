.class public final Lcom/android/launcher3/d0$a;
.super Ljava/lang/Object;
.source "DevicePaddings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private final a:I

.field private final b:Lcom/android/launcher3/d0$b;

.field private final c:Lcom/android/launcher3/d0$b;

.field private final d:Lcom/android/launcher3/d0$b;


# direct methods
.method public constructor <init>(ILcom/android/launcher3/d0$b;Lcom/android/launcher3/d0$b;Lcom/android/launcher3/d0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/launcher3/d0$a;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/d0$a;->b:Lcom/android/launcher3/d0$b;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/d0$a;->c:Lcom/android/launcher3/d0$b;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/d0$a;->d:Lcom/android/launcher3/d0$b;

    .line 11
    .line 12
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/d0$a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/d0$a;->a:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public b(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/d0$a;->d:Lcom/android/launcher3/d0$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/d0$b;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/d0$a;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public d(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/d0$a;->c:Lcom/android/launcher3/d0$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/d0$b;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/d0$a;->b:Lcom/android/launcher3/d0$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/d0$b;->a(I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/d0$a;->a:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/d0$a;->e(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/android/launcher3/d0$a;->a:I

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lcom/android/launcher3/d0$a;->d(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget v2, p0, Lcom/android/launcher3/d0$a;->a:I

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Lcom/android/launcher3/d0$a;->b(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/2addr v0, v1

    .line 20
    add-int/2addr v0, v2

    .line 21
    iget p0, p0, Lcom/android/launcher3/d0$a;->a:I

    .line 22
    .line 23
    sub-int/2addr v0, p0

    .line 24
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/4 v0, 0x3

    .line 29
    if-gt p0, v0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method
