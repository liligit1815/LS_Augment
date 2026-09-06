.class public final Lcom/android/launcher3/widget/custom/ai/o;
.super Ljava/lang/Object;
.source "AICustomWidgetDataHelper_Factory.java"

# interfaces
.implements Lf4/c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lf4/c<",
        "Lcom/android/launcher3/widget/custom/ai/n;",
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


# direct methods
.method public constructor <init>(Lg4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/o;->a:Lg4/a;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Lg4/a;)Lcom/android/launcher3/widget/custom/ai/o;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lg4/a<",
            "Landroid/content/Context;",
            ">;)",
            "Lcom/android/launcher3/widget/custom/ai/o;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/o;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/custom/ai/o;-><init>(Lg4/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Landroid/content/Context;)Lcom/android/launcher3/widget/custom/ai/n;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/custom/ai/n;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()Lcom/android/launcher3/widget/custom/ai/n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/o;->a:Lg4/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/ai/o;->c(Landroid/content/Context;)Lcom/android/launcher3/widget/custom/ai/n;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/o;->b()Lcom/android/launcher3/widget/custom/ai/n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
