.class public final synthetic Lcom/android/launcher3/b4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/Y0$a;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/q4;

.field public final synthetic b:Lcom/android/launcher3/util/L1;

.field public final synthetic c:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/q4;Lcom/android/launcher3/util/L1;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/b4;->a:Lcom/android/launcher3/q4;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/b4;->b:Lcom/android/launcher3/util/L1;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/b4;->c:Ljava/util/Set;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/b4;->a:Lcom/android/launcher3/q4;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/b4;->b:Lcom/android/launcher3/util/L1;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/b4;->c:Ljava/util/Set;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1, p2}, Lcom/android/launcher3/q4;->w(Lcom/android/launcher3/q4;Lcom/android/launcher3/util/L1;Ljava/util/Set;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
