.class Lcom/android/launcher3/widget/T0$a;
.super Ljava/lang/Object;
.source "WidgetHostViewLoader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/widget/T0;->a()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/widget/U;

.field final synthetic h:Landroid/os/Bundle;

.field final synthetic i:Lcom/android/launcher3/widget/T0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/widget/T0;Lcom/android/launcher3/widget/U;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/T0$a;->i:Lcom/android/launcher3/widget/T0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/widget/T0$a;->g:Lcom/android/launcher3/widget/U;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/widget/T0$a;->h:Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/T0$a;->i:Lcom/android/launcher3/widget/T0;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->I1()Lcom/android/launcher3/widget/l0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/widget/l0;->r()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput v1, v0, Lcom/android/launcher3/widget/T0;->m:I

    .line 14
    .line 15
    new-instance v0, Lcom/android/launcher3/widget/Y0;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/widget/T0$a;->i:Lcom/android/launcher3/widget/T0;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/android/launcher3/widget/T0;->i:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/widget/T0$a;->i:Lcom/android/launcher3/widget/T0;

    .line 25
    .line 26
    iget v1, v1, Lcom/android/launcher3/widget/T0;->m:I

    .line 27
    .line 28
    iget-object v2, p0, Lcom/android/launcher3/widget/T0$a;->g:Lcom/android/launcher3/widget/U;

    .line 29
    .line 30
    iget-object v3, p0, Lcom/android/launcher3/widget/T0$a;->h:Landroid/os/Bundle;

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher3/widget/Y0;->c(ILandroid/appwidget/AppWidgetProviderInfo;Landroid/os/Bundle;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/widget/T0$a;->i:Lcom/android/launcher3/widget/T0;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/widget/T0;->j:Landroid/os/Handler;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/widget/T0;->g:Ljava/lang/Runnable;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method
