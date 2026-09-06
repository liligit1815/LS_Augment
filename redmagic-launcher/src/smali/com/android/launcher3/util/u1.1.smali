.class public final Lcom/android/launcher3/util/u1;
.super Ljava/lang/Object;
.source "MultiPropertyDelegate.kt"


# instance fields
.field private final a:Lcom/android/launcher3/util/v1$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "*>.c;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/launcher3/util/v1$c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/v1<",
            "*>.c;)V"
        }
    .end annotation

    const-string v0, "property"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/util/u1;->a:Lcom/android/launcher3/util/v1$c;

    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/util/v1;Ljava/lang/Enum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/v1<",
            "*>;",
            "Ljava/lang/Enum<",
            "*>;)V"
        }
    .end annotation

    const-string v0, "factory"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "enum"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    move-result-object p1

    const-string p2, "get(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/android/launcher3/util/u1;-><init>(Lcom/android/launcher3/util/v1$c;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;LB4/i;)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "LB4/i<",
            "*>;)F"
        }
    .end annotation

    .line 1
    const-string p1, "kProperty"

    .line 2
    .line 3
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/u1;->a:Lcom/android/launcher3/util/v1$c;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/util/v1$c;->c()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final b(Ljava/lang/Object;LB4/i;F)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "LB4/i<",
            "*>;F)V"
        }
    .end annotation

    .line 1
    const-string p1, "kProperty"

    .line 2
    .line 3
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/u1;->a:Lcom/android/launcher3/util/v1$c;

    .line 7
    .line 8
    invoke-virtual {p0, p3}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
