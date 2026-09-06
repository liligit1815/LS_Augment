.class Lcom/google/android/material/tabs/e$b;
.super Ljava/lang/Object;
.source "TabLayout.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/tabs/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field private a:Z

.field final synthetic b:Lcom/google/android/material/tabs/e;


# direct methods
.method constructor <init>(Lcom/google/android/material/tabs/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/tabs/e$b;->b:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroidx/viewpager/widget/ViewPager;Landroidx/viewpager/widget/a;Landroidx/viewpager/widget/a;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/google/android/material/tabs/e$b;->b:Lcom/google/android/material/tabs/e;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/google/android/material/tabs/e;->V:Landroidx/viewpager/widget/ViewPager;

    .line 4
    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/google/android/material/tabs/e$b;->a:Z

    .line 8
    .line 9
    invoke-virtual {p2, p3, p0}, Lcom/google/android/material/tabs/e;->M(Landroidx/viewpager/widget/a;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method b(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/tabs/e$b;->a:Z

    .line 2
    .line 3
    return-void
.end method
