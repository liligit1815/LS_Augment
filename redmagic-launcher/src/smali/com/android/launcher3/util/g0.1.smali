.class public Lcom/android/launcher3/util/g0;
.super Ljava/lang/Object;
.source "DynamicResource.java"

# interfaces
.implements Lx2/h;
.implements Lx2/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lx2/h;",
        "Lx2/e<",
        "Lx2/h;",
        ">;"
    }
.end annotation


# static fields
.field private static final i:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/util/g0;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Landroid/content/Context;

.field private h:Lx2/h;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/e0;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/util/e0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/launcher3/util/g0;->i:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/T1;Lcom/android/launcher3/util/K;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/g0;->g:Landroid/content/Context;

    .line 5
    .line 6
    const-class p1, Lx2/h;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p2, p0, p1, v0}, Lcom/android/launcher3/util/T1;->b(Lx2/e;Ljava/lang/Class;Z)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Lcom/android/launcher3/util/f0;

    .line 13
    .line 14
    invoke-direct {p1, p0, p2}, Lcom/android/launcher3/util/f0;-><init>(Lcom/android/launcher3/util/g0;Lcom/android/launcher3/util/T1;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/util/g0;Lcom/android/launcher3/util/T1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/g0;->f(Lcom/android/launcher3/util/T1;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic f(Lcom/android/launcher3/util/T1;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/T1;->d(Lx2/e;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i(Landroid/content/Context;)Lx2/h;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/g0;->i:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/android/launcher3/util/g0;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/util/g0;->h:Lx2/h;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    return-object v0
.end method


# virtual methods
.method public bridge synthetic G(Lx2/c;Landroid/content/Context;)V
    .locals 0

    .line 1
    check-cast p1, Lx2/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/g0;->g(Lx2/h;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic W(Lx2/c;)V
    .locals 0

    .line 1
    check-cast p1, Lx2/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/g0;->h(Lx2/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/g0;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public g(Lx2/h;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/g0;->h:Lx2/h;

    .line 2
    .line 3
    return-void
.end method

.method public getFloat(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/g0;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getFloat(I)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getInt(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/g0;->g:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public h(Lx2/h;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/util/g0;->h:Lx2/h;

    .line 3
    .line 4
    return-void
.end method
