.class public Lcom/android/launcher3/util/z1;
.super Ljava/lang/Object;
.source "MultiTranslateDelegate.java"


# instance fields
.field private final a:Lcom/android/launcher3/util/v1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lcom/android/launcher3/util/v1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    const/16 v0, 0x8

    .line 1
    invoke-direct {p0, p1, v0, v0}, Lcom/android/launcher3/util/z1;-><init>(Landroid/view/View;II)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;II)V
    .locals 3

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Lcom/android/launcher3/util/v1;

    sget-object v1, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    new-instance v2, Lcom/android/launcher3/B0;

    invoke-direct {v2}, Lcom/android/launcher3/B0;-><init>()V

    invoke-direct {v0, p1, v1, p2, v2}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V

    iput-object v0, p0, Lcom/android/launcher3/util/z1;->a:Lcom/android/launcher3/util/v1;

    .line 4
    new-instance p2, Lcom/android/launcher3/util/v1;

    sget-object v0, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    new-instance v1, Lcom/android/launcher3/B0;

    invoke-direct {v1}, Lcom/android/launcher3/B0;-><init>()V

    invoke-direct {p2, p1, v0, p3, v1}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V

    iput-object p2, p0, Lcom/android/launcher3/util/z1;->b:Lcom/android/launcher3/util/v1;

    return-void
.end method


# virtual methods
.method public a(I)Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/z1;->a:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(I)Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/z1;->b:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(IFF)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/z1;->a(I)Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/z1;->b(I)Lcom/android/launcher3/util/v1$c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, p3}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
