.class public final Landroidx/lifecycle/f$b;
.super Ljava/lang/Object;
.source "LegacySavedStateHandleController.kt"

# interfaces
.implements Landroidx/lifecycle/h;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/lifecycle/f;->c(Le0/d;Landroidx/lifecycle/g;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/lifecycle/g;

.field final synthetic h:Le0/d;


# direct methods
.method constructor <init>(Landroidx/lifecycle/g;Le0/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/lifecycle/f$b;->g:Landroidx/lifecycle/g;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/lifecycle/f$b;->h:Le0/d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b(LW/d;Landroidx/lifecycle/g$a;)V
    .locals 1

    .line 1
    const-string v0, "source"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "event"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Landroidx/lifecycle/g$a;->ON_START:Landroidx/lifecycle/g$a;

    .line 12
    .line 13
    if-ne p2, p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Landroidx/lifecycle/f$b;->g:Landroidx/lifecycle/g;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroidx/lifecycle/g;->c(LW/c;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Landroidx/lifecycle/f$b;->h:Le0/d;

    .line 21
    .line 22
    const-class p1, Landroidx/lifecycle/f$a;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Le0/d;->i(Ljava/lang/Class;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
