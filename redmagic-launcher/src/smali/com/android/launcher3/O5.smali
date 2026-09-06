.class public final Lcom/android/launcher3/O5;
.super Ljava/lang/Object;
.source "UtilitiesKt.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/O5$c;
    }
.end annotation


# static fields
.field public static final a:Lcom/android/launcher3/O5;

.field public static final b:Lcom/android/launcher3/O5$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/O5$c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Lcom/android/launcher3/O5$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/O5$c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/O5;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/O5;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/O5;->a:Lcom/android/launcher3/O5;

    .line 7
    .line 8
    new-instance v0, Lcom/android/launcher3/O5$a;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/android/launcher3/O5$a;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/O5;->b:Lcom/android/launcher3/O5$c;

    .line 14
    .line 15
    new-instance v0, Lcom/android/launcher3/O5$b;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/android/launcher3/O5$b;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/android/launcher3/O5;->c:Lcom/android/launcher3/O5$c;

    .line 21
    .line 22
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final varargs a(Landroid/view/View;Landroid/view/ViewParent;[Lcom/android/launcher3/O5$c;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/ViewParent;",
            "[",
            "Lcom/android/launcher3/O5$c<",
            "*>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "modifiers"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    array-length v0, p2

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-ge v1, v0, :cond_1

    .line 16
    .line 17
    aget-object v2, p2, v1

    .line 18
    .line 19
    move-object v3, p0

    .line 20
    check-cast v3, Landroid/view/ViewGroup;

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Lcom/android/launcher3/O5$c;->c(Landroid/view/ViewGroup;)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    if-ne p0, p1, :cond_2

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    instance-of v0, v0, Landroid/view/View;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v0, "null cannot be cast to non-null type android.view.View"

    .line 44
    .line 45
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    check-cast p0, Landroid/view/View;

    .line 49
    .line 50
    array-length v0, p2

    .line 51
    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    check-cast p2, [Lcom/android/launcher3/O5$c;

    .line 56
    .line 57
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/O5;->a(Landroid/view/View;Landroid/view/ViewParent;[Lcom/android/launcher3/O5$c;)V

    .line 58
    .line 59
    .line 60
    :cond_3
    :goto_1
    return-void
.end method

.method public static final varargs b(Landroid/view/View;Landroid/view/ViewParent;[Lcom/android/launcher3/O5$c;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/view/ViewParent;",
            "[",
            "Lcom/android/launcher3/O5$c<",
            "*>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "modifiers"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    array-length v0, p2

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-ge v1, v0, :cond_1

    .line 16
    .line 17
    aget-object v2, p2, v1

    .line 18
    .line 19
    move-object v3, p0

    .line 20
    check-cast v3, Landroid/view/ViewGroup;

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Lcom/android/launcher3/O5$c;->b(Landroid/view/ViewGroup;)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    if-ne p0, p1, :cond_2

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    instance-of v0, v0, Landroid/view/View;

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v0, "null cannot be cast to non-null type android.view.View"

    .line 44
    .line 45
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    check-cast p0, Landroid/view/View;

    .line 49
    .line 50
    array-length v0, p2

    .line 51
    invoke-static {p2, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    check-cast p2, [Lcom/android/launcher3/O5$c;

    .line 56
    .line 57
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/O5;->b(Landroid/view/View;Landroid/view/ViewParent;[Lcom/android/launcher3/O5$c;)V

    .line 58
    .line 59
    .line 60
    :cond_3
    :goto_1
    return-void
.end method
