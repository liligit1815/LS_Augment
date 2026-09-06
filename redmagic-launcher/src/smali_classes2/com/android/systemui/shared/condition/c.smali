.class public final synthetic Lcom/android/systemui/shared/condition/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroidx/lifecycle/h;


# instance fields
.field public final synthetic g:Lcom/android/systemui/shared/condition/Condition;

.field public final synthetic h:Lcom/android/systemui/shared/condition/Condition$Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/Condition$Callback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/condition/c;->g:Lcom/android/systemui/shared/condition/Condition;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/systemui/shared/condition/c;->h:Lcom/android/systemui/shared/condition/Condition$Callback;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b(LW/d;Landroidx/lifecycle/g$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/condition/c;->g:Lcom/android/systemui/shared/condition/Condition;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/systemui/shared/condition/c;->h:Lcom/android/systemui/shared/condition/Condition$Callback;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, Lcom/android/systemui/shared/condition/Condition;->a(Lcom/android/systemui/shared/condition/Condition;Lcom/android/systemui/shared/condition/Condition$Callback;LW/d;Landroidx/lifecycle/g$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
