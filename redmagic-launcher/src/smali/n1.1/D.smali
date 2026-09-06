.class public final Ln1/D;
.super Ljava/lang/Object;
.source "ThemeManager_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Ln1/C;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/J3;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Ln1/C$b;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Lg4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/J3;",
            ">;",
            "Lg4/a<",
            "Ln1/C$b;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ln1/D;->a:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Ln1/D;->b:Lg4/a;

    .line 7
    .line 8
    iput-object p3, p0, Ln1/D;->c:Lg4/a;

    .line 9
    .line 10
    iput-object p4, p0, Ln1/D;->d:Lg4/a;

    .line 11
    .line 12
    return-void
.end method

.method public static a(Lg4/a;Lg4/a;Lg4/a;Lg4/a;)Ln1/D;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/J3;",
            ">;",
            "Lg4/a<",
            "Ln1/C$b;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)",
            "Ln1/D;"
        }
    .end annotation

    .line 1
    new-instance v0, Ln1/D;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ln1/D;-><init>(Lg4/a;Lg4/a;Lg4/a;Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Landroid/content/Context;Lcom/android/launcher3/J3;Ln1/C$b;Lcom/android/launcher3/util/K;)Ln1/C;
    .locals 1

    .line 1
    new-instance v0, Ln1/C;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ln1/C;-><init>(Landroid/content/Context;Lcom/android/launcher3/J3;Ln1/C$b;Lcom/android/launcher3/util/K;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Ln1/C;
    .locals 3

    .line 1
    iget-object v0, p0, Ln1/D;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/content/Context;

    .line 8
    .line 9
    iget-object v1, p0, Ln1/D;->b:Lg4/a;

    .line 10
    .line 11
    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/android/launcher3/J3;

    .line 16
    .line 17
    iget-object v2, p0, Ln1/D;->c:Lg4/a;

    .line 18
    .line 19
    invoke-interface {v2}, Lg4/a;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ln1/C$b;

    .line 24
    .line 25
    iget-object p0, p0, Ln1/D;->d:Lg4/a;

    .line 26
    .line 27
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/android/launcher3/util/K;

    .line 32
    .line 33
    invoke-static {v0, v1, v2, p0}, Ln1/D;->c(Landroid/content/Context;Lcom/android/launcher3/J3;Ln1/C$b;Lcom/android/launcher3/util/K;)Ln1/C;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ln1/D;->b()Ln1/C;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
