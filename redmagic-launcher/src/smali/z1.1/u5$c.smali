.class Lz1/u5$c;
.super Ljava/lang/Object;
.source "WidgetsModel.java"

# interfaces
.implements Ljava/util/function/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/u5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Predicate<",
        "Lz1/Z4;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/F1;

.field private final b:Lcom/android/launcher3/f;

.field private c:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lz1/u5$c;->a:Lcom/android/launcher3/F1;

    .line 5
    .line 6
    iput-object p3, p0, Lz1/u5$c;->b:Lcom/android/launcher3/f;

    .line 7
    .line 8
    iput-object p1, p0, Lz1/u5$c;->c:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lz1/Z4;)Z
    .locals 3

    .line 1
    iget-object v0, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/widget/U;->u()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    and-int/lit8 v0, v0, 0x2

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    iget-object v0, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/widget/U;->C()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget-object v0, p0, Lz1/u5$c;->b:Lcom/android/launcher3/f;

    .line 25
    .line 26
    iget-object p0, p0, Lz1/u5$c;->c:Landroid/content/Context;

    .line 27
    .line 28
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iget-object v2, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 35
    .line 36
    invoke-virtual {v0, p0, v2, p1}, Lcom/android/launcher3/f;->c(Lcom/android/launcher3/P2;Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_2

    .line 41
    .line 42
    return v1

    .line 43
    :cond_2
    const/4 p0, 0x1

    .line 44
    return p0
.end method

.method public bridge synthetic test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lz1/Z4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lz1/u5$c;->a(Lz1/Z4;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
