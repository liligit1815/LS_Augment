.class public final synthetic Lcom/android/launcher3/util/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroid/view/View;

.field public final synthetic h:Lcom/android/launcher3/util/s$a;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lcom/android/launcher3/util/s$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/n;->g:Landroid/view/View;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/n;->h:Lcom/android/launcher3/util/s$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/n;->g:Landroid/view/View;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/n;->h:Lcom/android/launcher3/util/s$a;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/util/s;->b(Landroid/view/View;Lcom/android/launcher3/util/s$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
