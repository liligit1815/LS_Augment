.class Lcom/android/launcher3/iconarrange/MenuIconArrange$b;
.super Ljava/lang/Object;
.source "MenuIconArrange.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/iconarrange/MenuIconArrange;->C(Lcom/android/launcher3/n0$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/n0$a;

.field final synthetic h:Lcom/android/launcher3/iconarrange/MenuIconArrange;


# direct methods
.method constructor <init>(Lcom/android/launcher3/iconarrange/MenuIconArrange;Lcom/android/launcher3/n0$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$b;->h:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$b;->g:Lcom/android/launcher3/n0$a;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$b;->h:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->g(Lcom/android/launcher3/iconarrange/MenuIconArrange;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$b;->h:Lcom/android/launcher3/iconarrange/MenuIconArrange;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/MenuIconArrange$b;->g:Lcom/android/launcher3/n0$a;

    .line 10
    .line 11
    invoke-static {v0, p0}, Lcom/android/launcher3/iconarrange/MenuIconArrange;->h(Lcom/android/launcher3/iconarrange/MenuIconArrange;Lcom/android/launcher3/n0$a;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
