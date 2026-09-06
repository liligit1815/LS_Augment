.class public final Lcom/android/launcher3/util/o1;
.super Ljava/lang/Object;
.source "LockedUserState_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/launcher3/util/n1;",
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
            "Lcom/android/launcher3/util/K;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lg4/a;Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
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
    iput-object p1, p0, Lcom/android/launcher3/util/o1;->a:Lg4/a;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/o1;->b:Lg4/a;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Lg4/a;Lg4/a;)Lcom/android/launcher3/util/o1;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;",
            "Lg4/a<",
            "Lcom/android/launcher3/util/K;",
            ">;)",
            "Lcom/android/launcher3/util/o1;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/o1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/util/o1;-><init>(Lg4/a;Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Landroid/content/Context;Lcom/android/launcher3/util/K;)Lcom/android/launcher3/util/n1;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/n1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/util/n1;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/K;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Lcom/android/launcher3/util/n1;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/o1;->a:Lg4/a;

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
    iget-object p0, p0, Lcom/android/launcher3/util/o1;->b:Lg4/a;

    .line 10
    .line 11
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/android/launcher3/util/K;

    .line 16
    .line 17
    invoke-static {v0, p0}, Lcom/android/launcher3/util/o1;->c(Landroid/content/Context;Lcom/android/launcher3/util/K;)Lcom/android/launcher3/util/n1;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/o1;->b()Lcom/android/launcher3/util/n1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
