.class Ll3/c$c;
.super Ll3/c$b;
.source "MaterialBackOrchestrator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll3/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, v0}, Ll3/c$b;-><init>(Ll3/c$a;)V

    return-void
.end method

.method synthetic constructor <init>(Ll3/c$a;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ll3/c$c;-><init>()V

    return-void
.end method


# virtual methods
.method c(Ll3/b;)Landroid/window/OnBackInvokedCallback;
    .locals 1

    .line 1
    new-instance v0, Ll3/c$c$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll3/c$c$a;-><init>(Ll3/c$c;Ll3/b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
