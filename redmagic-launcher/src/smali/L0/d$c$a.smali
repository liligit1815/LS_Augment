.class final LL0/d$c$a;
.super Ljava/lang/Object;
.source "SettingsAwareViewCapture.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LL0/d$c;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# instance fields
.field final synthetic g:LL0/d;

.field final synthetic h:Z


# direct methods
.method constructor <init>(LL0/d;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, LL0/d$c$a;->g:LL0/d;

    .line 2
    .line 3
    iput-boolean p2, p0, LL0/d$c$a;->h:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LL0/d$c$a;->g:LL0/d;

    .line 2
    .line 3
    iget-boolean p0, p0, LL0/d$c$a;->h:Z

    .line 4
    .line 5
    invoke-virtual {v0, p0}, LL0/n;->j(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
