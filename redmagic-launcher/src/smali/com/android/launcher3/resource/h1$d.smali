.class Lcom/android/launcher3/resource/h1$d;
.super Ljava/lang/Object;
.source "ThirdHiddenAppsManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/resource/h1;->I0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ljava/util/ArrayList;

.field final synthetic h:Lcom/android/launcher3/resource/h1;


# direct methods
.method constructor <init>(Lcom/android/launcher3/resource/h1;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/resource/h1$d;->h:Lcom/android/launcher3/resource/h1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/resource/h1$d;->g:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/h1$d;->h:Lcom/android/launcher3/resource/h1;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/resource/h1;->H(Lcom/android/launcher3/resource/h1;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/resource/h1$d;->g:Ljava/util/ArrayList;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, p0, v2}, Lcom/android/launcher3/resource/h1;->T(Landroid/content/Context;Ljava/util/ArrayList;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
